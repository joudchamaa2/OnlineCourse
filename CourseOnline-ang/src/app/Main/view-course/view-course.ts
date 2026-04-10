import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink , Router } from "@angular/router";
import { Server } from '../../server';
import { RouterModule } from '@angular/router';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-view-course',
  imports: [CommonModule, RouterLink,RouterModule],
  templateUrl: './view-course.html',
  styleUrl: './view-course.css',
})
export class ViewCourse {
  course : any;
  videos:any[] = [];

    constructor(public auth:Server , private router:Router , private activate: ActivatedRoute){}
    ngOnInit(){
      const token = localStorage.getItem('token');
      if(!token){
        this.router.navigate(['/login']);
      }
      const id = this.activate.snapshot.paramMap.get('id');
      this.auth.ViewCourse(Number(id)).subscribe({
        next : (res : any) =>  {
          this.course = res.course;
          this.videos = res.course.videos
          
          console.log(res);
          
          
        },
        error : (err:any)  => {
          console.error("Error :" , err);
          
        }   
       })
    }
}
