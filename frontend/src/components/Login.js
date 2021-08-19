import { useState } from "react";
import "../assets/css/Login.css";
import "../assets/css/loader.css";
import swal from 'sweetalert';
import typing from "../assets/media/typing.gif";
import axios from "axios";
import URL from "../URL";
import {Redirect, Router} from 'react-router-dom'

const Login =(props)=>
{
    
    const [coverClass, setCoverClass] = useState("cover cover-register");
    
    const forgetPasswordHandler=()=>{
        swal({
            text:"Take a deep breath and try to remember your password.",
            confirmButtonColor: "#f5e44f",
            confirmButtonText: "Yes, delete it!",
        });
    }

    const [loading, setLoading] = useState(false);
    const [created, setCreated] = useState(false);
    const [error, setError] = useState(false);


    const [email, setEmail] = useState();
    const emailChangeHandler=(event)=>
    {
        setEmail(event.target.value);
    }

    const [pass, setPass] = useState();
    const passChangeHandler=(event)=>
    {
        setPass(event.target.value);
    }

    const [pass2, setPass2] = useState();
    const pass2ChangeHandler=(event)=>
    {
        setPass2(event.target.value);
    }

    const [name, setName] = useState();
    const nameChangeHandler=(event)=>
    {
        setName(event.target.value);
    }


    const [warning, setWarning] = useState(false);
    const registerHandler=(e)=>
    {
        e.preventDefault();
        if(pass==pass2)
        {
            setLoading(true)
            setWarning(false)
            
                const registerDetails={
                    "email": email,
                    "password1": pass,
                    "password2": pass,
                    "name": name
                };
            
            
                axios.post(`${URL}/api/users/registration/`, registerDetails)
                .then(res =>{console.log("Status code: ",res.status);
                    setLoading(false);
                    if(res.status==201)
                    setCreated(true)
                    else
                    setError(true)
                })
                .catch((error) => {
                    console.log("Problem submitting New Post, Error: ", error.status);
                    setWarning(true);
                  });
        }
        else
        {
            setWarning(true);
        }
    }

    const loginHandler=(e)=>
    {
        e.preventDefault();
        const authDetails = 
            {
                "email": email,
                "password": pass
            }
        

        axios.post(`${URL}/api/auth/login/`, authDetails)
        .then((res)=>{console.log(res);
            props.onLogin(true);
        })
        .catch((error) => {
            setWarning(true);
            console.log("Problem submitting New Post, Error: ", error.status);
            setWarning(true);
          });
    }
    
    return(
        <div className="form-wrapper">
            <div className="login">
                <img src={typing} className={coverClass}/>
                <h1>Welcome back</h1>
                <p>New here? <a onClick={()=>{setCoverClass("cover"); setWarning(false)}}>Create an account now!</a></p>
                <form>
                    <label>Email ID</label>
                    <input type="text" required onChange={emailChangeHandler} value={email}/>
                    <label>Password</label>
                    <input type="password" required onChange={passChangeHandler} value={pass}/>
                    <a className="forgot-password" onClick={forgetPasswordHandler}>Forgot password?</a>
                    {
                        warning?
                            <span className="warning login-warning">User doesn't exist :/</span>
                        :null
                    }
                    <button type="submit" onClick={loginHandler}>Log in</button>
                </form>
            </div>
            <div className="divider"> </div>
            <div className="register">
                <h1>Register Now</h1>
                <p>Existing User? <a onClick={()=>{setCoverClass("cover cover-register"); setWarning(false)}}>Click here to login!</a></p>
                <form>
                    <label>Email ID</label>
                    <input type="email" required required onChange={emailChangeHandler} value={email}/>
                    <label>Full Name</label>
                    <input type="text" required onChange={nameChangeHandler} value={name}/>
                    <label>Password</label>
                    <input type="password" required onChange={passChangeHandler} value={pass}/>
                    <label>Confirm Password</label>
                    <input type="password" required onChange={pass2ChangeHandler} value={pass2}/>
                    {
                        warning?
                            <span className="warning">The passwords do not match!!</span>
                        :(created?<span className="warning success">Account created! Verify your email.</span>:error?<span className="warning">Could not create user :/ </span>:null)
                    }
                    {
                        loading?
                        <div className="lds-ring"><div></div><div></div><div></div><div></div></div>
                        :null
                    }
                    <button type="submit" className="registerBtn" onClick={registerHandler}>Register</button>
                </form>
            </div>
            
        </div>
    );
}

export default Login;