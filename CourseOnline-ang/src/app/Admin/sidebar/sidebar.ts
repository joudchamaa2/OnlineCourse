import { Component } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { RouterModule } from '@angular/router';
import { Server } from '../../server';

@Component({
  selector: 'app-sidebar',
  imports: [RouterLink , RouterModule],
  templateUrl: './sidebar.html',
  styleUrl: './sidebar.css',
})
export class Sidebar {
  constructor(private auth:Server , public router:Router){}
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
