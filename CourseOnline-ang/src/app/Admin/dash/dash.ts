import { Component, OnInit } from '@angular/core';
import { Server } from '../../server';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-dash',
  imports: [CommonModule],
  templateUrl: './dash.html',
  styleUrl: './dash.css',
})
export class Dash implements OnInit {
    user:number=0;
    tuser:any;
    count :number = 0;
    constructor(private http:Server,public rout:Router){}
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
    this.admin();
    this.Count();
    
  }
  admin(){
      this.http.Admin().subscribe({
        next: res => {
        console.log('API Response:', res); // Check this in console
        this.user = res.user;
        this.tuser = res.tuser
        
      },
      error: err => {
        console.error('API Error:', err);
      } 
      }
      )
    }
    Count(){
      
      this.http.CountCourse().subscribe({
        next: res => {
        console.log('API Response:', res);
        this.count = res.course;
      },
    }
    )
    
    }
}
