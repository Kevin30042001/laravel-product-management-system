-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2025 a las 20:21:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel_products`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_30_180750_create_products_table', 1),
(5, '2025_01_30_180754_create_reviews_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `average_rating` decimal(3,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category`, `stock`, `average_rating`, `created_at`, `updated_at`) VALUES
(4, 'iPhone 14 Pro', 'El último iPhone con la mejor cámara y rendimiento', 999.99, 'Electrónicos', 50, 4.00, '2025-01-31 23:23:48', '2025-02-01 00:00:19'),
(5, 'Samsung Galaxy S23', 'Teléfono Android premium con gran pantalla', 899.99, 'Electrònicos', 45, 4.50, '2025-01-31 23:24:21', '2025-01-31 23:37:15'),
(6, 'MacBook Pro 16', 'Laptop profesional para creativos', 2499.99, 'Computadoras', 25, 3.67, '2025-01-31 23:25:01', '2025-01-31 23:37:02'),
(7, 'iPad Air', 'Tablet versátil para trabajo y entretenimiento', 599.99, 'Tablets', 60, 5.00, '2025-01-31 23:25:37', '2025-01-31 23:35:40'),
(8, 'AirPods Pro', 'Auriculares inalámbricos con cancelación de ruido', 249.99, 'Accesorios', 100, 4.50, '2025-01-31 23:26:49', '2025-01-31 23:38:03'),
(9, 'Dell XPS 13', 'Ultrabook premium con pantalla InfinityEdge', 1299.99, 'Computadoras', 30, 3.00, '2025-01-31 23:27:26', '2025-01-31 23:37:48'),
(10, 'Sony WH-1000XM4', 'Auriculares premium con el mejor sonido', 349.99, 'Audio', 40, 4.00, '2025-01-31 23:28:37', '2025-01-31 23:32:40'),
(11, 'Nintendo Switch OLED', 'Consola híbrida con pantalla mejorada', 349.99, 'Videojuegos', 35, 3.33, '2025-01-31 23:29:10', '2025-01-31 23:37:29'),
(12, 'Canon EOS R6', 'Cámara mirrorless profesional', 2499.99, 'Fotografía', 20, 4.00, '2025-01-31 23:29:53', '2025-01-31 23:38:23'),
(13, 'LG OLED C1 65', 'Smart TV con la mejor calidad de imagen', 1999.99, 'TV y Video', 20, 4.00, '2025-01-31 23:30:31', '2025-01-31 23:36:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(4, 8, 4, 4, '¡Excelente producto! Superó mis expectativas.', '2025-01-31 23:30:56', '2025-01-31 23:30:56'),
(5, 8, 7, 5, '¡Excelente producto! Superó mis expectativas.', '2025-01-31 23:31:09', '2025-01-31 23:31:09'),
(6, 8, 12, 5, '¡Excelente producto! Superó mis expectativas.', '2025-01-31 23:31:18', '2025-01-31 23:31:18'),
(7, 8, 6, 3, 'Muy buen producto, pero el precio es algo elevado.', '2025-01-31 23:31:43', '2025-01-31 23:31:43'),
(8, 8, 9, 3, 'Muy buen producto, pero el precio es algo elevado.', '2025-01-31 23:31:53', '2025-01-31 23:31:53'),
(9, 8, 13, 5, 'Muy buen producto, pero el precio es algo elevado.', '2025-01-31 23:32:06', '2025-01-31 23:32:06'),
(10, 8, 5, 5, 'La mejor compra que he hecho. Totalmente recomendado.', '2025-01-31 23:32:19', '2025-01-31 23:32:19'),
(11, 8, 8, 5, 'La mejor compra que he hecho. Totalmente recomendado.', '2025-01-31 23:32:29', '2025-01-31 23:32:29'),
(12, 8, 10, 4, 'La mejor compra que he hecho. Totalmente recomendado.', '2025-01-31 23:32:40', '2025-01-31 23:32:40'),
(13, 8, 11, 2, '\'Producto decente, pero hay mejores opciones.', '2025-01-31 23:32:55', '2025-01-31 23:32:55'),
(14, 8, 12, 3, '\'Producto decente, pero hay mejores opciones.', '2025-01-31 23:33:05', '2025-01-31 23:33:05'),
(15, 8, 9, 2, '\'Producto decente, pero hay mejores opciones.', '2025-01-31 23:33:18', '2025-01-31 23:33:18'),
(16, 8, 13, 3, '\'Producto decente, pero hay mejores opciones.', '2025-01-31 23:33:29', '2025-01-31 23:33:29'),
(17, 4, 4, 4, 'Es un buen producto pero podría mejorar.', '2025-01-31 23:34:50', '2025-01-31 23:34:50'),
(18, 4, 6, 4, 'Es un buen producto pero podría mejorar.', '2025-01-31 23:34:57', '2025-01-31 23:34:57'),
(19, 4, 9, 3, 'Es un buen producto pero podría mejorar.', '2025-01-31 23:35:04', '2025-01-31 23:35:04'),
(20, 4, 12, 4, 'Es un buen producto pero podría mejorar.', '2025-01-31 23:35:12', '2025-01-31 23:35:12'),
(21, 4, 7, 5, '¡Perfecto! Justo lo que necesitaba.', '2025-01-31 23:35:40', '2025-01-31 23:35:40'),
(22, 4, 11, 4, '¡Perfecto! Justo lo que necesitaba.', '2025-01-31 23:35:50', '2025-01-31 23:35:50'),
(23, 4, 13, 4, '¡Perfecto! Justo lo que necesitaba.', '2025-01-31 23:36:02', '2025-01-31 23:36:02'),
(24, 6, 6, 4, 'Me gustó mucho, cumple con lo prometido', '2025-01-31 23:37:02', '2025-01-31 23:37:02'),
(25, 6, 5, 4, 'Me gustó mucho, cumple con lo prometido', '2025-01-31 23:37:15', '2025-01-31 23:37:15'),
(26, 6, 11, 4, 'Me gustó mucho, cumple con lo prometido', '2025-01-31 23:37:29', '2025-01-31 23:37:29'),
(27, 6, 9, 4, 'Me gustó mucho, cumple con lo prometido', '2025-01-31 23:37:48', '2025-01-31 23:37:48'),
(28, 6, 8, 4, 'Me gustó mucho, cumple con lo prometido', '2025-01-31 23:38:03', '2025-01-31 23:38:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4GTTbQl0Lxum59mr9721CRhdBmhWuQqB02kRPyCp', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZVpXaGpXT0txbUhxSGhBSVFtWU1JSWloR3Z2Q0Fqb1MxaGpQY3BGVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1738350898);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Usuario Test 1', 'test1@example.com', NULL, '$2y$12$pScUoJIMcHX9jToqhA1G/O9DQPLJu/sahmhCrfujpAqH7LBgKqb.2', NULL, '2025-01-31 23:21:22', '2025-01-31 23:21:22'),
(5, 'Usuario Test 2', 'test2@example.com', NULL, '$2y$12$lutEibhblEC/5MkfYcZcyuRRFGWbxkdk3aaQH5vz34NTEO9NtPSM6', NULL, '2025-01-31 23:21:51', '2025-01-31 23:21:51'),
(6, 'Usuario Test 3', 'test3@example.com', NULL, '$2y$12$ZUbff4t/l6PWg1aDgKTZfe5ZTDVtXwS8GCdNptrokWLibgjF4r7La', NULL, '2025-01-31 23:22:14', '2025-01-31 23:22:14'),
(7, 'Usuario Test 4', 'test4@example.com', NULL, '$2y$12$pthE5/yxgMi2WyxPuyWesOti1dPDAeNZm3vj9Iw0uDnhKZXg4tu62', NULL, '2025-01-31 23:22:42', '2025-01-31 23:22:42'),
(8, 'Usuario Test 5', 'test5@example.com', NULL, '$2y$12$IokpI/THFFHm4V5ursjGduNffjCIs82IfNuHn5L1PVSX8A0riytBG', NULL, '2025-01-31 23:23:03', '2025-01-31 23:23:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
