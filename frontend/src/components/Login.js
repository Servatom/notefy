import { useState } from "react";
import "../assets/css/Login.css";
import swal from 'sweetalert';
import typing from "../assets/media/typing.gif";

const Login =()=>
{
    
    const [coverClass, setCoverClass] = useState("cover cover-register");
    
    const forgetPasswordHandler=()=>{
        swal({
            text:"Take a deep breath and try to remember your password.",
            confirmButtonColor: "#f5e44f",
            confirmButtonText: "Yes, delete it!",
        });
    }

    return(
        <div className="form-wrapper">
            <div className="login">
                <img src={typing} className={coverClass}/>
                <h1>Welcome back</h1>
                <p>New here? <a onClick={()=>{setCoverClass("cover")}}>Create an account now!</a></p>
                <form>
                    <label>Username</label>
                    <input type="text" required/>
                    <label>Password</label>
                    <input type="password" required/>
                    <a className="forgot-password" onClick={forgetPasswordHandler}>Forgot password?</a>
                    <button type="submit">Log in</button>
                </form>
            </div>
            <div className="divider"> </div>
            <div className="register">
                <h1>Register Now</h1>
                <p>Existing User? <a onClick={()=>{setCoverClass("cover cover-register")}}>Click here to login!</a></p>
                <form>
                    <label>Email ID</label>
                    <input type="email" required/>
                    <label>Username</label>
                    <input type="text" required/>
                    <label>Password</label>
                    <input type="password" required/>
                    <label>Confirm Password</label>
                    <input type="password" required/>
                    <button type="submit">Register</button>
                </form>
            </div>
            
        </div>
    );
}

export default Login;