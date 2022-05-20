import React, { useState } from 'react';
import {BrowserRouter, Route, Routes, NavLink, Redirect, useHistory} from 'react-router-dom' // instead of "Switch"
import { Switch } from 'react-router-dom' 
import './App.css';
import {AlertBirdHome} from './Components/AlertbirdHome';
import {AlertAddBirdwatching} from './Components/AlertbirdAddBirdwatching';
import {AlertBirdMembersPage} from './Components/AlertbirdMemberspage';
//import {Variables}  from './Components/Variables';

function App(){
  return (
    <BrowserRouter>      
      <div className="d-flex flex-row">      
        <div className="App container" id="my_app">        
          <nav className="navbar navbar-expand-sm bg-light navbar-dark shadow-sm" style={{backgroundColor:"#aaa"}}>
            <ul className = "navbar-nav">
              <li className= "nav-item m-1">
                <NavLink className="btn btn-light" to="/AlertbirdHome" >
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                  <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
                </svg>
                </NavLink>
              </li>              
              <li className= "nav-item m-1">
                <NavLink className="btn btn-light" to={"/AddBirdwatching"}>
                  Registrera fågelskådning
                </NavLink>
              </li>
              <li className= "nav-item m-1">
                <NavLink className="btn btn-light" to={"/AlertBirdMembersPage"}>
                  Medlem
                </NavLink>
              </li>      
          </ul>
        </nav>
        <Switch> 
            <Route exact path="/" component={AlertBirdHome}/>      
            <Route exact path='/AlertbirdHome' component={AlertBirdHome}/> 
            <Route exact path='/AddBirdwatching' component={AlertAddBirdwatching}/>
            <Route exact path='/AlertBirdMembersPage' component={AlertBirdMembersPage}/>                         
        </Switch>
        </div>
      </div>
      <div className="d-flex flex-row">     
      </div>
    </BrowserRouter>
  );
}

export default App;
