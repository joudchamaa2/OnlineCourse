import { Component } from '@angular/core';
import { Server } from '../server';
import { CommonModule } from '@angular/common';
import { RouterLink } from "@angular/router";

@Component({
  selector: 'app-home',
  imports: [CommonModule, RouterLink],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home {
    course:any[] = [];
    image:any;
    constructor(private server:Server){}
    ngOnInit(): void {
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
