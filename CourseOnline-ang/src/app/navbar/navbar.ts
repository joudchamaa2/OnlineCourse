import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterLink } from "@angular/router";
import { RouterModule } from '@angular/router';
import { Server } from '../server';

@Component({
  selector: 'app-navbar',
  imports: [CommonModule, RouterLink , RouterModule],
  templateUrl: './navbar.html',
  styleUrl: './navbar.css',
  standalone: true,
})
export class Navbar {
    constructor(public auth:Server , private router:Router){}
    menuOpen = false;
    toggleMenu(){
      this.menuOpen = !this.menuOpen;
    }
    onLogout(){
      this.auth.logout().subscribe({
        next: () => {
        localStorage.removeItem('token');
        this.router.navigate(['/login']);
      },
      error: (err) => console.error('Logout failed', err)
    });
    
    }
}
