<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $token = $user->createToken('auth-token', ['*'], now()->addHour())->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $token,
            'expires_at' => now()->addHour()->toDateTimeString()
        ], 201);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['Las credenciales proporcionadas son incorrectas.'],
            ]);
        }

        $user->tokens()->delete();
        $token = $user->createToken('auth-token', ['*'], now()->addHour());

        return response()->json([
            'token' => $token->plainTextToken,
            'expires_at' => now()->addHour()->toDateTimeString()
        ]);
    }

    public function refreshToken(Request $request)
    {
        $user = $request->user();
        $request->user()->currentAccessToken()->delete();
        $token = $user->createToken('auth-token', ['*'], now()->addHour());

        return response()->json([
            'token' => $token->plainTextToken,
            'expires_at' => now()->addHour()->toDateTimeString()
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Token revocado exitosamente']);
    }
}