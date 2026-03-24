import { Component } from '@angular/core';
import { Server } from '../../server';
import { CommonModule } from '@angular/common';
import { Router, RouterLink } from "@angular/router";

@Component({
  selector: 'app-browsecourses',
  imports: [CommonModule, RouterLink],
  templateUrl: './browsecourses.html',
  styleUrl: './browsecourses.css',
})
export class Browsecourses {
  courses:any[] = [];
    constructor(private server:Server, public router : Router ){}
    ngOnInit(): void {
      const token = localStorage.getItem('token');
      if(!token){
        this.router.navigate(['/login']);
      }
      this.server.BrowseCourses().subscribe({
        next:(res:any)=>{
          this.courses = res.courses;
          console.log("Success:",res);
        }
      })
    }
}
