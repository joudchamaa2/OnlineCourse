import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Server } from '../../server';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-solve-quiz',
  imports: [CommonModule],
  templateUrl: './solve-quiz.html',
  styleUrl: './solve-quiz.css',
})
export class SolveQuiz {
  constructor(private server : Server , public router :Router , private activate : ActivatedRoute){}
  quiz:any;
  id:any;
  ngOnInit(){
    this.id = this.activate.snapshot.paramMap.get('id');
    const token = localStorage.getItem('token');
    if(!token){
      this.router.navigate(['/login']);
    }
    this.server.getQuiz(this.id).subscribe({
      next : (res) => {
        this.quiz = res.quizes;
        console.log(res);
      },
      error : (err) => {
        console.error('Error fetching quiz:', err);
        if(err.status === 403){
          this.router.navigate(['/subscribe']);
        }
      }
    })
  }
}
