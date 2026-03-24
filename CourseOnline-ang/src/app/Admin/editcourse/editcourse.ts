import { Component } from '@angular/core';
import { Admin } from '../../admin';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-editcourse',
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './editcourse.html',
  styleUrl: './editcourse.css',
})
export class Editcourse {
  message:any;
    course:any = {
      title:'',
      description:'',
      price:0,
      category:'',
      image:'',
    };
    selectedFile!: File;

    onFileChange(event: any) { 
    this.selectedFile = event.target.files[0];
    } 
    constructor(private admin:Admin , private activate :ActivatedRoute,public router:Router){}
      
      ngOnInit(){
        const token = localStorage.getItem('token');
      if(!token){
        this.router.navigate(['/login']);
      }
      if(localStorage.getItem('role') != 'admin'){
        this.router.navigate(['/home']);
      }
        const id = this.activate.snapshot.paramMap.get('id');
        this.admin.GetCourseById(Number(id)).subscribe({
          next: (res : any) =>{
            this.course = res.course;
            console.log(res);
          }
        })
      }
      update() {

  const id = Number(this.activate.snapshot.paramMap.get('id'));

  const formData = new FormData();

  formData.append('title', this.course.title);
  formData.append('description', this.course.description);
  formData.append('price', this.course.price.toString());
  formData.append('category', this.course.category);

  // only send image if selected
  if (this.selectedFile) {
    formData.append('image', this.selectedFile);
  } else if (this.course.image) {
    formData.append('image', this.course.image);
  }

  // VERY IMPORTANT if your Laravel route is PUT
  formData.append('_method', 'PUT');

  this.admin.updateCourse(id, formData).subscribe({
    next: (res: any) => {
      console.log(res);
      this.message = res.message;
    },
    error: (err: any) => {
      console.log(err);
    }
  });
}

      
    }

