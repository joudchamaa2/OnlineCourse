import { Component, OnInit } from '@angular/core';
import { Router, RouterLink } from "@angular/router";
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Server } from '../../server';

@Component({
  selector: 'app-login',
  standalone:true,
  imports: [RouterLink , FormsModule , CommonModule ],
  templateUrl: './login.html',
  styleUrls: ['./login.css'],
})
export class Login{
  login = {
    email:'',
    password:'',
  }
  error :any;
  constructor(private http:Server , public router:Router){}
  message = ''
  sendLogin(){
    this.http.login(this.login).subscribe({
      next:(res:any) => {
        console.log('Success:',res);
        localStorage.setItem('token',res.token)
        localStorage.setItem('role',res.user_info.role);
        if(res.user_info.role === 'admin'){
          this.router.navigate(['/admin']);
        }else{
        this.router.navigate(['/home']);
        }
      },
      error:(err)=>{
        this.message = 'Your Email or password is incorrect , Please try again';
        console.error('Error:',err);
        this.error = err;
      }
    })
  }
}
