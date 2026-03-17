import { Component } from '@angular/core';
import { Admin } from '../../admin';
import { Router, RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-courses',
  imports: [CommonModule, RouterLink],
  templateUrl: './courses.html',
  styleUrl: './courses.css',
})
export class Courses {
  courses:any;
  message = '';
  constructor(private http:Admin , public router:Router){}
  ngOnInit(): void {
      const token = localStorage.getItem('token');
      const role = localStorage.getItem('role');
    if(!token){
      this.router.navigate(['/login']);
      return;
      
    }
    if(role !== 'admin'){
      this.router.navigate(['/home']);
      return;
    }
    this.Courses();
    
  }
  Courses(){
    this.http.courses().subscribe({
      next: res => {
        this.courses = res.courses;
        console.log('Api Response:',res);
      },
      error: err => console.error('API Error:', err)
    })
  }
  delete(course:number){
    this.http.deleteCourse(course).subscribe({
      next: res => {
        this.message = 'Course deleted successfully';
        this.Courses(); // Refresh the course list after deletion
      }
    })
  }
}
