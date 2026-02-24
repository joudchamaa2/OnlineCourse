import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Sidebar } from '../sidebar/sidebar';
import { Server } from '../../server';
import { Router, RouterOutlet } from '@angular/router';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-page',
  imports: [Sidebar, CommonModule, RouterOutlet,RouterModule],
  templateUrl: './page.html',
  styleUrl: './page.css',
})
export class Page{
    
  
}
