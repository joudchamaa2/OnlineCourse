import { Component } from '@angular/core';
import { Server } from '../../server';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-quiz',
  imports: [CommonModule , FormsModule , RouterLink],
  templateUrl: './quiz.html',
  styleUrl: './quiz.css',
})
export class Quiz {
  message: { text: string; color: string } = { text: '', color: 'inherit' };
  id: any;
  quiz = {
    question: "",
    answer: "",
    option1:"",
    option2:"",
    option3:"",
  }
  selectedfile!:File;
  constructor(private server:Server , public router : Router , private activate:ActivatedRoute){}
  
  ngOnInit(){
    this.id = this.activate.snapshot.paramMap.get('id');
    if(localStorage.getItem('role') != 'admin' && localStorage.getItem('role') != 'indtructor'){
      this.router.navigate(['/home'])
  }
  const token = localStorage.getItem('token');
  if(!token){
    this.router.navigate(['/login']);
  }
}
quizcreate(){
  const formData = new FormData();
  formData.append('question',this.quiz.question);
  formData.append('answer',this.quiz.answer);
  formData.append('option1',this.quiz.option1);
  formData.append('option2',this.quiz.option2);
  formData.append('option3',this.quiz.option3);
  this.server.createQuiz(formData , this.id).subscribe({
    next:(res) => {
      console.log(res);
      this.message = { text: 'Quiz Created Successfully', color: 'green' };
    },
    error:(err) => {
      console.error('Quiz creation failed', err);
      this.message = { text: 'Failed to create quiz', color: 'red' };
    }
  })
}


}
