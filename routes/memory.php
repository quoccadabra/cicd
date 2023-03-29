<?php

use App\Http\Controllers\MemoryController;
use Illuminate\Support\Facades\Route;

// Route::prefix(['guest'])->name('guest.')->group(function () {
//     Route::prefix('guest', function () {
//         Route::get('memory', MemoryController::class)->name('memory');
//     });
// });
// Route::middleware(['auth'])->name('auth.')->group(function () {
//     Route::prefix('auth', function () {
//         Route::get('memory', MemoryController::class)->name('memory');
//     });
// });
Route::prefix('guest')->prefix('guest')->group(function () {
    Route::resource('memory', MemoryController::class);
})->middleware('guest');

Route::prefix('auth')->prefix('auth')->group(function () {
    Route::resource('memory', MemoryController::class);
})->middleware('auth');