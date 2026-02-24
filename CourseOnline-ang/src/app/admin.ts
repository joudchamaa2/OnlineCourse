import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class Admin {
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
  
}
