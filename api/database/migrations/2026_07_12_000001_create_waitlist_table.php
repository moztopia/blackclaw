<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('waitlist', function (Blueprint $table): void {
            $table->id();
            $table->string('name');
            $table->string('email');
            $table->string('what_for')->default('launch');
            $table->string('country_code', 8)->nullable();
            $table->string('phone', 20)->nullable();
            $table->timestamps();

            $table->unique(['email', 'phone']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('waitlist');
    }
};
