import { Component } from '@angular/core';
import { Router, RouterLink } from "@angular/router";

@Component({
  selector: 'app-subscribe',
  imports: [RouterLink],
  templateUrl: './subscribe.html',
  styleUrl: './subscribe.css',
})
export class Subscribe {
  constructor(public router : Router){}
    ngOnInit(){
      const token = localStorage.getItem('token');
      if(!token){
        this.router.navigate(['/login']);
      }
    }
}
