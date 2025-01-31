<?php

use Laravel\Sanctum\Http\Middleware\AuthenticateSession;
use App\Http\Middleware\VerifyCsrfToken;
use App\Http\Middleware\EncryptCookies;

return [
   'stateful' => explode(',', env('SANCTUM_STATEFUL_DOMAINS', sprintf(
       '%s%s',
       'localhost,localhost:3000,localhost:8080,127.0.0.1,127.0.0.1:8000,::1',
       env('APP_URL') ? ','.parse_url(env('APP_URL'), PHP_URL_HOST) : ''
   ))),

   'guard' => ['web'],

   'expiration' => 5,

   'token_prefix' => '',

   'middleware' => [
       'verify_csrf_token' => VerifyCsrfToken::class,
       'encrypt_cookies' => EncryptCookies::class,
       'authenticate_session' => AuthenticateSession::class,
   ],

   'token_model' => Laravel\Sanctum\PersonalAccessToken::class,

   'token_name' => env('SANCTUM_TOKEN_NAME', 'auth-token'),

   'max_tokens_per_user' => env('SANCTUM_MAX_TOKENS_PER_USER', null),
];