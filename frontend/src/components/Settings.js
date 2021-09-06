import { useContext, useEffect, useState } from "react";
import AuthContext from "../store/auth-context";
import "../assets/css/Settings.css";
import {MdEmail} from 'react-icons/md';


const Settings =(props)=>
{
    
    const authCtx = useContext(AuthContext);
    
    
    return(
        <div className="settingsHeader">
            <div className="userInfo">
                <h1>Hello, {props.userInfo.name}!</h1>
                <span><MdEmail className="icon"/>{props.userInfo.email}</span>
            </div>
            <div className="avatar">
                <div class="pfpContainer">
                        <img src={props.userInfo.avatar} class="pfp" alt="Profile picture" />
                </div>
            </div>
        </div>
    )
}

export default Settings;