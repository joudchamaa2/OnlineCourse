import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})

export class Admin {
  isImage():boolean {
    return localStorage.getItem('image') !== null;
  }
  constructor(private http : HttpClient){}
  users(){
    const token = localStorage.getItem('token');
    return this.http.get<any>('http://127.0.0.1:8000/api/admin/users',{
      headers:{
        'Authorization':`Bearer ${token}`,
      }
    })
  }
  delete(id:number){
    const token = localStorage.getItem('token');
    return this.http.delete(`http://127.0.0.1:8000/api/admin/DeleteUser/${id}`,{
      headers:{
        Authorization: `Bearer ${token}`,
        Accept: 'application/json'
      }
    });
  }
  role(id:any,data:any){
    const token = localStorage.getItem('token');
    return this.http.put(`http://127.0.0.1:8000/api/admin/editRole/${id}`,data,{
      headers:{
        Authorization: `Bearer ${token}`,
        Accept: 'application/json'
      }
    })
  }
  create(data:any){
    const token = localStorage.getItem('token');
    return this.http.post('http://127.0.0.1:8000/api/course/create',data,{
      headers:{
        Authorization: `Bearer ${token}`,
        Accept : 'application/json',
      },
      withCredentials:true,
    })
  }
  courses(){
    const token = localStorage.getItem('token');
    return this.http.get<any>('http://127.0.0.1:8000/api/admin/courses',{
      headers:{
        Authorization:`Bearer ${token}`,
      }
    })
  }
  deleteCourse(course:number){
    const token = localStorage.getItem('token');
    return this.http.delete(`http://127.0.0.1:8000/api/admin/course/delete/${course}`,{
      headers:{
        Authorization: `Bearer ${token}`,
      }
    })
  }
  GetCourseById(course:number){
    const token = localStorage.getItem('token');
    return this.http.get<any>(`http://127.0.0.1:8000/api/admin/course/GetCourseById/${course}`,{
      headers:{
        Authorization: `Bearer ${token}`,
      }
    })
  }
  updateCourse(course:number,data:any){
    const token = localStorage.getItem('token');
    return this.http.post(`http://127.0.0.1:8000/api/admin/updateCourse/${course}`,data,{
      headers:{
        Authorization: `Bearer ${token}`,
        Accept: 'application/json',
      }
    })
  }
  image(data:any){
    const token = localStorage.getItem('token');
    return this.http.post('http://127.0.0.1:8000/api/admin/image',data,{
      headers:{
        Authorization: `Bearer ${token}`,
        Accept: 'application/json',
      },
      withCredentials:true,
    })
  }
  getImages(){
    const token = localStorage.getItem('token');
    return this.http.get<any>('http://127.0.0.1:8000/api/admin/images',{
      headers:{
        Authorization: `Bearer ${token}`,
      }
    })
  }
  createvideo(course:number,data:any){
    const token = localStorage.getItem('token');
    return this.http.post(`http://127.0.0.1:8000/api/admin/course/video/${course}/create`,data,{
      headers:{
        Authorization: `Bearer ${token}`,
        Accept: 'application/json',
      }
    })
  }
  
}
