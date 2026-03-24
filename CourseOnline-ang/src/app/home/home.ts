import { Component } from '@angular/core';
import { Server } from '../server';
import { CommonModule } from '@angular/common';
import { Router, RouterLink } from "@angular/router";

@Component({
  selector: 'app-home',
  imports: [CommonModule, RouterLink],
  templateUrl: './home.html',
  styleUrl: './home.css',
})

export class Home {
    course:any[] = [];
    image:any;
    constructor(private server:Server , public router:Router){}
    ngOnInit(): void {
      const token = localStorage.getItem('token');
      if(!token){
        this.router.navigate(['/login']);
      }
      this.server.home().subscribe({
        next:(res:any)=>{
          this.course = res.course;
          this.image = res.image.image;
          console.log(res);
        },
        error:(err)=>{
          console.error('Error:',err);
        }

      })
    }
    
    
}
