import { Component } from '@angular/core';
import { Admin } from '../../admin';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';

@Component({
  selector: 'app-create-video',
  imports: [FormsModule, CommonModule, RouterLink],
  templateUrl: './create-video.html',
  styleUrl: './create-video.css',
})
export class CreateVideo {
  id:any;
  onFileChange(event:any){
    this.selectedFile = event.target.files[0];
  }
  message:any;
  video = {
    title:"",
    description:"",
  }
    selectedFile:File | undefined;
    
    constructor(private http:Admin, private route:ActivatedRoute, public router: Router ){}
    ngOnInit(){
      this.id = this.route.snapshot.paramMap.get('id');
      const token = localStorage.getItem('token');
      if(localStorage.getItem('role') != 'admin' && localStorage.getItem('role') != 'indtructor'){
        this.router.navigate(['/home']);
      }
      if(!token){
        this.router.navigate(['/login']);
      }
      
    }
    create(){
      console.log("Created begin");
      
      // Validation: Check if video file is selected
      if (!this.selectedFile) {
        this.message = 'Please select a video file';
        return;
      }
      
      // Validation: Check if title is provided
      if (!this.video.title.trim()) {
        this.message = 'Please enter a video title';
        return;
      }

      const formData = new FormData();

      formData.append('title',this.video.title);
      formData.append('description',this.video.description);
      formData.append('video',this.selectedFile);
      this.http.createvideo(Number(this.id),formData).subscribe({
        next:(res)=>{
          this.message = 'Video Created Successfully';
          console.log(res);
          
        },
        error:(err)=>{
          this.message = 'Failed to create video';
          console.error('Error create video:',err);
        }
      })
    }

    cancel(){
      this.router.navigate(['/viewcourse']);
    }
}
