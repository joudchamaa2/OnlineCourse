import { RedirectCommand, Routes } from '@angular/router';
import { Login } from './auth/login/login';
import { Register } from './auth/register/register';
import { Home } from './home/home';
import { Page } from './Admin/page/page';
import { Dash } from './Admin/dash/dash';
import { Users } from './Admin/users/users';
import { Edituser } from './Admin/edituser/edituser';
import { Createcourse } from './createcourse/createcourse';
import { Courses } from './Admin/courses/courses';
import { Editcourse } from './Admin/editcourse/editcourse';
import { Image } from './Admin/image/image';
import { Browsecourses } from './Main/browsecourses/browsecourses';
import { CreateVideo } from './Admin/create-video/create-video';
import { ViewCourse } from './Main/view-course/view-course';
import { ViewVideo } from './Main/view-video/view-video';
import { Subscribe } from './Main/subscribe/subscribe';
import { Monthly } from './subscribe/monthly/monthly';
import { Yearly } from './subscribe/yearly/yearly';



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
            {path:'courses',component:Courses},
            {path:'editcourse/:id',component:Editcourse},
            {path:'image',component:Image},
            {path:'createvideo/:id',component:CreateVideo}
            
        ]
    },
    {path:'createcourse',component:Createcourse},
    {path:'browsecourses' ,component:Browsecourses},
    {path:'viewcourse/:id',component:ViewCourse},
    {path:'viewvideo/:id',component:ViewVideo},
    {path:'subscribe',component:Subscribe},
    {path:'monthly',component:Monthly},
    {path:'yearly',component:Yearly}

    
];
