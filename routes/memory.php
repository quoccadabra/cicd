<?php

use App\Http\Controllers\MemoryController;
use Illuminate\Routing\Route;

Route::middleware(['guest'])->name('guest.')->prefix('guest')->group(function () {
    Route::get('memory', MemoryController::class)->name('memory');
});
Route::middleware(['auth'])->name('my.')->prefix('auth')->group(function () {
    Route::get('memory', MemoryController::class)->name('memory');
});