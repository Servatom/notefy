import { useContext, useEffect, useState } from "react";
import AuthContext from "../store/auth-context";
import "../assets/css/Settings.css";
import "../assets/css/Login.css";
import {MdEmail} from 'react-icons/md';
import gif from "../assets/media/settings2.gif";

const Settings =(props)=>
{
    
    const authCtx = useContext(AuthContext);
    
    const [pass, setPass] = useState("");
    const oldPassHandler=(event)=>
    {
        setPass(event.target.value);
    }

    const [pass2, setPass2] = useState("");
    const pass2ChangeHandler=(event)=>
    {
        setPass2(event.target.value);
    }

    const changePasswordHandler=(e)=>
    {
        e.preventDefault();
    }
    
    return(
        <div className="settings">
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
            <div className="form-wrapper settingsForm">
                <form>
                <h2>Change Password:</h2>
                    <label>Old Password</label>
                    <input type="password" required onChange={oldPassHandler} value={pass} disabled/>
                    <label>New Password</label>
                    <input type="password" required onChange={oldPassHandler} value={pass} disabled/>
                    <label>Confirm Password</label>
                    <input type="password" required onChange={pass2ChangeHandler} value={pass2} disabled/>
                    <button type="submit" onClick={changePasswordHandler}>Log in</button>
                </form>
            </div>
        </div>
    ) 
}

export default Settings;