import { Component } from '@angular/core';
import { Server } from '../../server';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-view-video',
  imports: [CommonModule, RouterLink],
  templateUrl: './view-video.html',
  styleUrls: ['./view-video.css'],
})
export class ViewVideo {
  video: any;

  constructor(
    private http: Server,
    private activate: ActivatedRoute,
    public route: Router
  ) {}

  ngOnInit() {
    

    // Then fetch video
    const id = this.activate.snapshot.paramMap.get('id');
    this.http.ViewVideo(Number(id)).subscribe({
      next: (res) => {
        this.video = res.video;
        console.log(res);
      },
      error: (err) => {
    if (err.status === 403) {
      this.route.navigate(['/subscribe']);
    }
    },
  })
}
}
