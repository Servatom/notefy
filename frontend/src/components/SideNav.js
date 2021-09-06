import "../assets/css/Sidenav.css";
import MoonToggle from "./MoonToggle";
import logo from "../assets/media/logo.png";
import {MdDashboard, MdSettings} from 'react-icons/md';
import {IoLogOut} from 'react-icons/io5';
import {AiFillDelete} from 'react-icons/ai';
import { useContext, useState } from "react";
import swal from 'sweetalert';
import { Link, Redirect, useHistory } from "react-router-dom";
import AuthContext from "../store/auth-context";

const SideNav =(props)=>
{   

    const authCtx = useContext(AuthContext);
    const history = useHistory();
    const allDeleteHandler=()=>
    {
        swal({
            title: "Delete all notes?",
            text: "This action cannot be reverted!!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          })
          .then((willDelete) => {
            if (willDelete) 
            {
              swal("Poof! Your notes have been deleted!", {
                icon: "success",
              });
            props.deleteAll(); 
            } 
            else 
            {
              swal("Your notes are safe!");
            }
          });
    }

    const logoutHandler=()=>
    {
      swal(
        {
          text:"Are you sure you want to log out?",
          icon:"warning",
          dangerMode:true,
          buttons: true,
        }
      )
      .then((willlogout)=>{
        if(willlogout)
        {
          console.log("logout");
          authCtx.logout();
          history.replace("/");
          
        }
      })
    }
 

    return(
        <div className="sidenav">
            <div className="navhead">
                <h2 className="heading">notefy</h2>
                <img src={logo} className="navlogo"/>
            </div>
            
            
            <a><h4 onClick={()=>props.setCurrentTab(1)} className={props.currentTab===1?"active":""} ><MdDashboard className="icon"/>Dashboard</h4></a>
            <a><h4 onClick={()=>props.setCurrentTab(2)} className={props.currentTab===2?"active":""} ><MdSettings className="icon"/>Settings</h4></a>
            <a onClick={logoutHandler}><h4 className="" ><IoLogOut className="icon"/>Logout</h4></a>
            <div className="sidenavIcons">
                <MoonToggle className="sidenav-moon"/>
                <AiFillDelete className="delete-all" onClick={allDeleteHandler}/>
            </div>
            
        </div>

    );
}

export default SideNav;