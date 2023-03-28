<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('memories', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->text('description')->nullable();
            $table->string('title', 255)->nullable();
            $table->string('place', 255)->nullable();
            $table->string('date', 50)->nullable();
            $table->string('image')->nullable();
            $table->string('group_id');
            $table->string('code', 12);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('memories');
    }
};
