import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class Server {
  constructor(private http:HttpClient){}
  isLoggedIn():boolean{
    return !!localStorage.getItem('token');
  }
  isAdmin():Boolean{
    return localStorage.getItem('role') === 'admin';
  }
  register(Data:any){
    return this.http.post('http://127.0.0.1:8000/api/auth/register',Data,{
      headers: {
        'Accept':'application/json'
      },
      withCredentials : true
    });
  }
  login(data:any){
    return this.http.post('http://127.0.0.1:8000/api/auth/login',data,{
      headers:{
        'Accept':'application/json'
      },
      withCredentials : true
    });
  }
  logout() {
  const token = localStorage.getItem('token');

  return this.http.post(
    'http://127.0.0.1:8000/api/auth/logout',
    {},
    {
      headers: {
        'Accept': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    }
  );
}
Admin(){
  const token = localStorage.getItem('token');
  return this.http.get<any>('http://127.0.0.1:8000/api/admin/dashboard',{
    headers:{
      'Authorization':`Bearer ${token}`,
    }
  });
}

}
