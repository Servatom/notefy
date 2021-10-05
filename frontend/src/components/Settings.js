import { useContext, useEffect, useState } from "react";
import AuthContext from "../store/auth-context";
import "../assets/css/Settings.css";
import "../assets/css/Login.css";
import {MdEmail} from 'react-icons/md';
import gif from "../assets/media/settings2.gif";
import {BsFillEyeFill, BsFillEyeSlashFill} from 'react-icons/bs';
import URL from "../URL";

const Settings =(props)=>
{
    
    const authCtx = useContext(AuthContext);
    
    const [oldPass, setOldPass] = useState("");
    const oldPassHandler=(event)=>
    {
        setOldPass(event.target.value);
    }

    const [newPass, setNewPass] = useState("");
    const newPassHandler=(event)=>
    {
        setNewPass(event.target.value);
    }
    const [pass2, setPass2] = useState("");
    const pass2ChangeHandler=(event)=>
    {
        setPass2(event.target.value);
    }


    const [loading, setLoading] = useState(false);
    const [success, setSuccess] = useState(false);
    const [error, setError] = useState({
        status: false,
        body: ""
    });


    const changePasswordHandler=(e)=>
    {
        e.preventDefault();
        setLoading(true)
            setError({
                status: false,
                body: ""
            })
        setSuccess(false);

        setLoading(true);

        if(newPass==pass2)
        {
            var myHeaders = new Headers();
            myHeaders.append("Authorization", "Token "+authCtx.token);
            myHeaders.append("Content-Type", "application/json");

            var raw = JSON.stringify({
            "new_password": newPass,
            "old_password": oldPass
            });

            var requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
            redirect: 'follow'
            };

            fetch(`${URL}/api/users/reset_password/`, requestOptions)
            .then(response => {
                
                setLoading(false)

                if(response.status==200)
                setSuccess(true)
                else
                setSuccess(false);

                return response.json();
            })
            .then(result => {
                console.log(result)
                
                let firstkey = Object.keys(result)[0];
                

                setError(
                    {
                        status: true,
                        body: result[firstkey]
                    }
                )
            
            })
            .catch(error => console.log('error', error));
        }
        else
        {
            setLoading(false);
            setError({
                status: true,
                body: "The passwords dont match!"
            });
        }
    }

    const changeAvatarHandler=()=>
    {
        var myHeaders = new Headers();
        myHeaders.append("Authorization", "Token "+authCtx.token);

        var requestOptions = {
        method: 'PUT',
        headers: myHeaders,
        redirect: 'follow'
        };

        fetch(`${URL}/api/users/avatar_change/`, requestOptions)
        .then(response => response.json())
        .then(result => {
            console.log(result)
            props.setUserInfo({
                ...props.userInfo,
                avatar: result.new_avatar
            })
        })
        .catch(error => console.log('error', error));
    }


    const [passVisible, setPassVisible] = useState(false);
    
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
                    <span className="changeAvatar" onClick={changeAvatarHandler}>Change Avatar</span>
                </div>
            </div>
            <div className="form-wrapper settingsForm">
                <form>
                <h2>Change Password:</h2>
                    <label>Old Password</label>
                    <div className="passbox">
                        <input type={passVisible?"text":"password"} required onChange={oldPassHandler} value={oldPass}/>
                        <div onClick={()=>setPassVisible(!passVisible)} className="icondiv">
                            {
                                passVisible?<BsFillEyeSlashFill/>:<BsFillEyeFill/>
                            }
                        </div>
                    </div>
                    <label>New Password</label>
                    <input type="password" required onChange={newPassHandler} value={newPass} />
                    <label>Confirm Password</label>
                    <input type="password" required onChange={pass2ChangeHandler} value={pass2} />
                    
                    {
                        success?<span className="warning success">Password Changed Successfully!</span>
                        :error.status?<span className="warning error">{error.body}</span>:null
                    }
                    {
                        loading?
                        <div className="lds-ring"><div></div><div></div><div></div><div></div></div>
                        :null
                    }
                    
                    <button type="submit" className="changepassBtn" onClick={changePasswordHandler}>Submit</button>
                </form>
            </div>
        </div>
    ) 
}

export default Settings;