import { Component } from '@angular/core';
import { Admin } from '../../admin';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-edit-video',
  imports: [CommonModule],
  templateUrl: './edit-video.html',
  styleUrl: './edit-video.css',
})
export class EditVideo {
    id:any;
    video:any;
    constructor(private http : Admin , public route : Router , private activate : ActivatedRoute){}
    ngOnInit(){
      const token = localStorage.getItem('token');
      if(localStorage.getItem('role') != 'admin'){
        this.route.navigate(['/home']);
      }
      if(!token){
        this.route.navigate(['/login']);
      }

      this.id = this.activate.snapshot.paramMap.get('id');
      this.http.GetVideoById(this.id).subscribe({
        next : (res) =>{
          this.video = res.video;
        }
      })
    }

  }
