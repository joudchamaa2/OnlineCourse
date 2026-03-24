import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Admin } from '../../admin';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

@Component({
  selector: 'app-image',
  imports: [FormsModule, CommonModule],
  templateUrl: './image.html',
  styleUrl: './image.css',
})
export class Image implements OnInit {
  selectedFile!: File;
  message = '';
  images: any[] = [];

  onFileChange(event: any) {
    if (event.target.files && event.target.files.length > 0) {
      this.selectedFile = event.target.files[0];
    }
  }

  constructor(private http: Admin , public router :Router) {}

  ngOnInit() {
    const token = localStorage.getItem('token');
      if(!token){
        this.router.navigate(['/login']);
      }
      if(localStorage.getItem('role') != 'admin'){
        this.router.navigate(['/home']);
      }
    this.getimage();
  }

  upload() {
    // Check if a file was selected
    if (!this.selectedFile) {
      this.message = 'Please select an image first';
      return;
    }

    const formData = new FormData();
    formData.append('image', this.selectedFile);

    this.http.image(formData).subscribe({
      next: (res) => {
        this.message = 'Image Uploaded Successfully';
        console.log(res);
        this.selectedFile = undefined as any;
        // Refresh the images list after upload
        this.getimage();
      },
      error: (err) => {
        this.message = 'Failed to upload Image';
        console.error('image error:', err);
      }
    });
  }

  getimage() {
    this.http.getImages().subscribe({
      next: (res) => {
        console.log('Api Response:', res);
        this.images = res.images;
      },
      error: (err) => {
        console.error('Error fetching images:', err);
      }
    });
  }
}
