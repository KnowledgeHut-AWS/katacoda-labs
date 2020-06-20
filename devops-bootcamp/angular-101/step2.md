## Adding Angular Code

We'll first add a HttpClient to our application

Open the  `angularly/src/app/app.module.ts`{{open}} file and add the following code:

<pre class="file" data-filename="angularly/src/app/app.module.ts" data-target="replace">
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
</pre>

We've simply added the `HttpClientModule` in the `imports` section to this file

Now let's create our `UI Compoments` these components are the building blocks of any web fronted written in Angular.

`ng g component bucky`{{execute}}

and 

`ng g component about`{{execute}}

`g` is the shorthand to `generate`

Go to the  `angularly/src/app/app-routing.module.ts`{{open}}  file and add the following routes:

<pre class="file" data-filename="angularly/src/app/app-routing.module.ts" data-target="replace">
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BuckyComponent } from './bucky/bucky.component';
import { AboutComponent } from './about/about.component';

const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch: 'full'},
  { path: 'home', component: BuckyComponent },
  { path: 'about', component: AboutComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
</pre>

We imported the Angular components and we declared three routes.

The first route is for redirecting the empty path to the home component, so we’ll be automatically redirected to the home page when we first visit the app.