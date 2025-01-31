# Sistema de Gestión de Productos

Sistema web moderno para la gestión de productos con autenticación y valoraciones.

## Características

- Autenticación de usuarios
- CRUD completo de productos
- Sistema de reseñas y valoraciones
- Diseño responsive con Tailwind CSS
- Dashboard interactivo
- Estadísticas de productos

## Requisitos

- PHP 8.2+
- Composer
- Node.js & NPM
- MySQL

## Instalación

1. Clonar el repositorio
```bash
git clone https://github.com/tuusuario/laravel-product-management-system.git
cd laravel-product-management-system

## Instalar dependencias

bashCopycomposer install
npm install

## Configurar entorno

bashCopycp .env.example .env
php artisan key:generate

## Configurar base de datos en .env

CopyDB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_products
DB_USERNAME=root
DB_PASSWORD=

## Migrar base de datos

bashCopyphp artisan migrate --seed

## Compilar assets

bashCopynpm run dev

## Iniciar servidor

bashCopyphp artisan serve
