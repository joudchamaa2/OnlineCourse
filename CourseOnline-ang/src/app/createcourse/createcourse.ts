import { Component } from '@angular/core';
import { Router, RouterLink } from "@angular/router";
import { Admin } from '../admin';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-createcourse',
  imports: [RouterLink ,  FormsModule ,CommonModule],
  templateUrl: './createcourse.html',
  styleUrl: './createcourse.css',
})
export class Createcourse {
  id:any;
    course = {
      title:"",
      description:"",
      category:"",
      price:0,
      
    }
    selectedFile!: File;

    constructor(private http:Admin , public router:Router,private activate:ActivatedRoute){}
    message = '';
    ngOnInit(){
        this.id = this.activate.snapshot.paramMap.get('id');
        console.log(this.id)
        if(localStorage.getItem('role') !== 'admin' || localStorage.getItem('role') !== 'indtructor'){
          this.router.navigate(['/home'])
        }
        const token = localStorage.getItem('token');
        if(!token){
          this.router.navigate(['/login']);
        }
    }
    create(){
      const formData = new FormData();
  formData.append('title', this.course.title);
  formData.append('description', this.course.description);
  formData.append('category', this.course.category);
  formData.append('price', this.course.price.toString());
  formData.append('image', this.selectedFile); // IMPORTANT
      this.http.create(formData).subscribe({
        next: (res) => {
          this.message = 'Course Created Successfully';
          console.log(res)
        },
        error: (err) => {
          this.message = 'Failed to create course';
          console.error('Course creation failed', err);
      },
    })
    }
    onFileChange(event: any) {
      this.selectedFile = event.target.files[0];
    }

}
