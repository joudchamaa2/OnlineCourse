import { Component } from '@angular/core';
import { Admin } from '../../admin';
import { Router, RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-managevideo',
  imports: [CommonModule, RouterLink],
  templateUrl: './managevideo.html',
  styleUrl: './managevideo.css',
})
export class Managevideo {
    message:any;
    video:any[] = [];
    constructor(private http:Admin , public route:Router , private activate : ActivatedRoute){}

    ngOnInit(){
      const token = localStorage.getItem('token');
      if(!token){
        this.route.navigate(['/login']);
      }
      if(localStorage.getItem('role') != 'admin'){
        this.route.navigate(['/home']);
      }
      this.getvideo();
      
    }
    getvideo(){
      console.log("Hello")
      this.http.GetVideo().subscribe({
        next:(res) =>{
          this.video = res.video ;
          console.log(res);
        },
        error:(err) =>{
          console.error('Error:' , err)
        }
      })
    }
    delete(id:any){
      this.http.DeleteVideo(id).subscribe({
        next : (res) =>{
          this.message = "Message Deleted Successfully";
          console.log(res)
        },
        error:(err) => {
          this.message = "Failed Deleteing Video , Please Try Again"
          console.error(err);
        }
      })
    }
}
