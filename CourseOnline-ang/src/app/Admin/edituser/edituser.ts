import { Component, OnInit } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { Admin } from '../../admin';
import { CommonModule } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { FormsModule } from '@angular/forms';



@Component({
  selector: 'app-edituser',
  imports: [RouterModule , CommonModule,FormsModule],
  templateUrl: './edituser.html',
  styleUrl: './edituser.css',
})
export class Edituser implements OnInit {
    id:any;
    role:string = '';
    constructor(private route : ActivatedRoute,private http:Admin , public router : Router){}
    ngOnInit(){
      const token = localStorage.getItem('token');
      if(!token){
        this.router.navigate(['/login']);
      }
      if(localStorage.getItem('role') != 'admin'){
        this.router.navigate(['/home']);
      }
      this.id = this.route.snapshot.paramMap.get('id');
      console.log(this.id);
      
    }
    editRole(){
        console.log("Role:", this.role);
        console.log("ID:", this.id);
        const data = {
        role :this.role
      };
      this.http.role(this.id,data).subscribe(res=>{
        alert('role updated successfully');
      })
    }
}

