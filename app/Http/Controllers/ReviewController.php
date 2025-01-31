<?php

namespace App\Http\Controllers;

use App\Models\Review;
use App\Models\Product;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    public function store(Request $request, Product $product)
    {
        $validated = $request->validate([
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'required|string'
        ]);

        $review = new Review($validated);
        $review->user_id = auth()->id();
        $product->reviews()->save($review);
        $product->calculateAverageRating();

        return back()->with('success', 'Reseña agregada exitosamente.');
    }
}