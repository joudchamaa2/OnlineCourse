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
  constructor(private http:Server , public router:Router){}
  sendLogin(){
    this.http.login(this.login).subscribe({
      next:(res:any) => {
        console.log('Success:',res);
        localStorage.setItem('token',res.token)
        this.router.navigate(['/home']);
      },
      error:(err)=>{
        console.error('Error:',err);
        alert('Error submiting Data');
      }
    })
  }
}
