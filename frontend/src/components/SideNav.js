import "../assets/css/Sidenav.css";
import MoonToggle from "./MoonToggle";
import logo from "../assets/media/logo.png";
import {MdDashboard, MdSettings} from 'react-icons/md';
import {IoLogOut} from 'react-icons/io5';
import {AiFillDelete} from 'react-icons/ai';
import { useState } from "react";
import swal from 'sweetalert';

const SideNav =(props)=>
{   

    
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


    return(
        <div className="sidenav">
            <div className="navhead">
                <h2 className="heading">notefy</h2>
                <img src={logo} className="navlogo"/>
            </div>
            
            
            <a><h4 className="active" ><MdDashboard className="icon"/>Dashboard</h4></a>
            <a><h4 className="" ><MdSettings className="icon"/>Settings</h4></a>
            <a><h4 className="" ><IoLogOut className="icon"/>Logout</h4></a>
            <div className="sidenavIcons">
                <MoonToggle className="sidenav-moon"/>
                <AiFillDelete className="delete-all" onClick={allDeleteHandler}/>
            </div>
            
        </div>
        
    );
}

export default SideNav;