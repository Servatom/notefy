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

    const [login, setLogin] = useState({

        email: "",
        password: ""
    });

    const [register, setRegister] = useState({

        email: "",
        username: "",
        password: ""
    });

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
            setWarning(false)
        }
        else
        {
            setWarning(true);
        }
    }

    const loginHandler=(e)=>
    {
        e.preventDefault();
        setWarning(true);

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
                            <span className="warning login-warning">User doesn't exist</span>
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
                        :null
                    }
                    <button type="submit" className="registerBtn" onClick={registerHandler}>Register</button>
                </form>
            </div>
            
        </div>
    );
}

export default Login;