import { Component } from '@angular/core';
import { Admin } from '../../admin';
import { Router, RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';


@Component({
  selector: 'app-users',
  imports: [CommonModule, RouterLink,RouterModule],
  templateUrl: './users.html',
  styleUrl: './users.css',
})
export class Users {
  user:any;
    constructor(private http:Admin,public rout:Router){}
    ngOnInit(): void {
      const token = localStorage.getItem('token');
      const role = localStorage.getItem('role');
    if(!token){
      this.rout.navigate(['/login']);
      return;
      
    }
    if(role !== 'admin'){
      this.rout.navigate(['/home']);
      return;
    }
    this.User();
    
  }
  User(){
    this.http.users().subscribe({
      next:res=>{
          console.log('API Response:', res); // Check this in console
          this.user = res.user;
        
      }
    })
  }
  delete(id:number){
    this.http.delete(id).subscribe({
      next: res => alert('User deleted successfully'),
      error: err => console.error('Error:', err)
    });
  }
}
