<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Models\User;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     */
    use RefreshDatabase;
    public function test_the_application_returns_a_successful_response(): void
    {
        // $user = User::factory()->create([
        //     'email'=> 'joud@gmail.com',
        //     'password' =>bcrypt('joudjou341'),
        // ]);
        $admin = User::factory()->create([
            'role'=>'admin',
        ]);
        $this->actingAs($admin,'sanctum');

        $response = $this->getJson('/api/admin/users');

        $response->assertStatus(201);
        // $response->assertJsonStructure([
        //     'token',
        //     'user' => [
        //         'id',
        //         'email',
        //         'name',
        //     ],
        // ]);
    }
}
