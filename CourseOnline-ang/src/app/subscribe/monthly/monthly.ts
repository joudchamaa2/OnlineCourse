import { Component } from '@angular/core';
import { Server } from '../../server';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-monthly',
  imports: [CommonModule, FormsModule],
  templateUrl: './monthly.html',
  styleUrls: ['./monthly.css'], // fixed here
})
export class Monthly {
  message:any;
  plan = {
    subscription_type: "monthly", // fixed here
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
        this.message = " You already have an active subscription "

      },
    });
  }
}
