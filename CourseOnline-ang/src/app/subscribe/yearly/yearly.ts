import { Component } from '@angular/core';
import { Server } from '../../server';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-yearly',
  imports: [CommonModule , FormsModule],
  templateUrl: './yearly.html',
  styleUrl: './yearly.css',
})
export class Yearly {
  message : any;
   plan = {
    subscription_type: "yearly", // fixed here
  };

  constructor(private http: Server, public route: Router) {}

  subscribe() {
    const data = { subscription_type: this.plan.subscription_type }; // send JSON

    this.http.subscribe(data).subscribe({
      next: (res) => {
        console.log(res);
        this.route.navigate(['/browsecourses']);
      },
      error: (err) => {
        console.log(err);
        this.message = "you already have an active subscription"
      },
    });
  }
}
