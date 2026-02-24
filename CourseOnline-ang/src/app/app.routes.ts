import { RedirectCommand, Routes } from '@angular/router';
import { Login } from './auth/login/login';
import { Register } from './auth/register/register';
import { Home } from './home/home';
import { Page } from './Admin/page/page';
import { Dash } from './Admin/dash/dash';
import { Users } from './Admin/users/users';
import { Edituser } from './Admin/edituser/edituser';



export const routes: Routes = [
    {path :'',redirectTo:'login', pathMatch:'full'},
    {path : 'login',component:Login},
    {path : 'register',component:Register},
    {path : "home",component:Home},
    {path: "admin",component:Page,
        children:[
            {path:'' ,component:Dash},
            {path:'users',component:Users},
            {path:'editUser/:id',component:Edituser},
            
        ]
    },
    
];
