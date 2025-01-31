<x-app-layout>
    <x-slot name="header">
        <div class="flex justify-between items-center">
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                {{ $product->name }}
            </h2>
            <a href="{{ route('products.index') }}" 
               class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">
                Volver
            </a>
        </div>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    @if(session('success'))
                        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                            <span class="block sm:inline">{{ session('success') }}</span>
                        </div>
                    @endif

                    <!-- Detalles del Producto -->
                    <div class="mb-8">
                        <div class="flex justify-between items-start mb-4">
                            <div>
                                <h3 class="text-2xl font-bold mb-2">{{ $product->name }}</h3>
                                <p class="text-gray-600 mb-4">{{ $product->description }}</p>
                            </div>
                            <div class="text-right">
                                <p class="text-2xl font-bold text-blue-600">${{ number_format($product->price, 2) }}</p>
                                <p class="text-gray-600">Stock: {{ $product->stock }}</p>
                            </div>
                        </div>
                        
                        <div class="flex items-center mb-4">
                            <div class="flex text-yellow-400">
                                @for($i = 1; $i <= 5; $i++)
                                    @if($i <= $product->average_rating)
                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24">
                                            <path d="M12 17.27L18.18 21L16.54 13.97L22 9.24L14.81 8.63L12 2L9.19 8.63L2 9.24L7.46 13.97L5.82 21L12 17.27Z"/>
                                        </svg>
                                    @else
                                        <svg class="w-5 h-5 fill-current text-gray-300" viewBox="0 0 24 24">
                                            <path d="M12 17.27L18.18 21L16.54 13.97L22 9.24L14.81 8.63L12 2L9.19 8.63L2 9.24L7.46 13.97L5.82 21L12 17.27Z"/>
                                        </svg>
                                    @endif
                                @endfor
                            </div>
                            <span class="ml-2 text-gray-600">
                                {{ number_format($product->average_rating, 1) }} ({{ $product->reviews->count() }} reseñas)
                            </span>
                        </div>
                    </div>

                    <!-- Formulario de Reseña -->
                    <div class="mb-8">
                        <h4 class="text-lg font-semibold mb-4">Agregar Reseña</h4>
                        <form action="{{ route('reviews.store', $product) }}" method="POST">
                            @csrf
                            <div class="mb-4">
                                <label for="rating" class="block text-gray-700 text-sm font-bold mb-2">
                                    Calificación
                                </label>
                                <select name="rating" id="rating" 
                                        class="shadow border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                        required>
                                    <option value="">Seleccionar...</option>
                                    @for($i = 1; $i <= 5; $i++)
                                        <option value="{{ $i }}">{{ $i }} estrellas</option>
                                    @endfor
                                </select>
                            </div>

                            <div class="mb-4">
                                <label for="comment" class="block text-gray-700 text-sm font-bold mb-2">
                                    Comentario
                                </label>
                                <textarea name="comment" id="comment" rows="3"
                                          class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                          required></textarea>
                            </div>

                            <button type="submit"
                                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                                Enviar Reseña
                            </button>
                        </form>
                    </div>

                    <!-- Lista de Reseñas -->
                    <div>
                        <h4 class="text-lg font-semibold mb-4">Reseñas</h4>
                        @forelse($product->reviews as $review)
                            <div class="border-b last:border-b-0 py-4">
                                <div class="flex items-center mb-2">
                                    <div class="text-yellow-400">
                                        @for($i = 1; $i <= 5; $i++)
                                            @if($i <= $review->rating)
                                                <span>★</span>
                                            @else
                                                <span class="text-gray-300">☆</span>
                                            @endif
                                        @endfor
                                    </div>
                                    <span class="ml-2 text-gray-600">{{ $review->user->name }}</span>
                                    <span class="ml-2 text-gray-400">{{ $review->created_at->diffForHumans() }}</span>
                                </div>
                                <p class="text-gray-700">{{ $review->comment }}</p>
                            </div>
                        @empty
                            <p class="text-gray-600">No hay reseñas todavía.</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>