<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Memory>
 */
class MemoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $index = 1;
        return [
            'user_id' => $index++,
            'description' => fake()->text(),
            'title' => fake()->title(),
            'place' => fake()->city().', Việt Nam',
            'date' => fake()->date(),
            'image' => null,
            'group_id' => $index++,
            'code' => fake()->regexify('[A-Za-z0-9]{12}')
        ];
    }
}
