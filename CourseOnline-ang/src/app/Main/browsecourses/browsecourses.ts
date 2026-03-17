import { Component } from '@angular/core';
import { Server } from '../../server';
import { CommonModule } from '@angular/common';
import { RouterLink } from "@angular/router";

@Component({
  selector: 'app-browsecourses',
  imports: [CommonModule, RouterLink],
  templateUrl: './browsecourses.html',
  styleUrl: './browsecourses.css',
})
export class Browsecourses {
  courses:any[] = [];
    constructor(private server:Server ){}
    ngOnInit(): void {
      this.server.BrowseCourses().subscribe({
        next:(res:any)=>{
          this.courses = res.courses;
          console.log("Success:",res);
        }
      })
    }
}
