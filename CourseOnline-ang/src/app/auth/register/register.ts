import { Component } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Server } from '../../server';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-register',
  imports: [RouterLink , FormsModule , CommonModule , RouterModule],
  templateUrl: './register.html',
  styleUrls: ['./register.css'],
  standalone : true ,
})
export class Register {
  register = {
    name:'',
    email:'',
    password:'',
  }
    constructor(private http : Server , public router:Router){}
  sendRegister(){
    this.http.register(this.register).subscribe({
      next:(res:any) => {
        console.log('Success:',res);
        localStorage.setItem('token',res.token);
        this.router.navigate(['/home']);
        
        
      },
      error:(err)=>{
        console.error('Error:',err);
        alert('Error submiting Data');
      }
    })
  }
}
