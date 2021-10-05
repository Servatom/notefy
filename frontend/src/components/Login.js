import { useContext, useState } from "react";
import "../assets/css/Login.css";
import "../assets/css/loader.css";
import swal from "sweetalert";
import typing from "../assets/media/typing.gif";
import URL from "../URL";
import { useHistory } from "react-router";
import AuthContext from "../store/auth-context";

const Login = () => {
  const authCtx = useContext(AuthContext);
  const history = useHistory();
  const mq = window.matchMedia("(mix-width: 480px)");

  const [coverClass, setCoverClass] = useState("cover cover-register");

  const forgetPasswordHandler = () => {
    swal({
      text: "Take a deep breath and try to remember your password.",
      confirmButtonColor: "#f5e44f",
      confirmButtonText: "Yes, delete it!",
    });
  };

  const [loading, setLoading] = useState(false);
  const [created, setCreated] = useState(false);
  const [error, setError] = useState({
    status: false,
    body: "",
  });

  const [email, setEmail] = useState("");
  const emailChangeHandler = (event) => {
    setEmail(event.target.value);
  };

  const [pass, setPass] = useState("");
  const passChangeHandler = (event) => {
    setPass(event.target.value);
  };

  const [pass2, setPass2] = useState("");
  const pass2ChangeHandler = (event) => {
    setPass2(event.target.value);
  };

  const [name, setName] = useState("");
  const nameChangeHandler = (event) => {
    setName(event.target.value);
  };

  const [warning, setWarning] = useState({
    status: false,
    body: "",
  });

  //Register handler
  const registerHandler = (e) => {
    e.preventDefault();
    setCreated(false);

    if (pass == pass2) {
      setLoading(true);
      setError({
        status: false,
        body: "",
      });

      var myHeaders = new Headers();
      myHeaders.append("Content-Type", "application/json");

      let registerDetails = JSON.stringify({
        email: email,
        password: pass,
        name: name,
      });

      var requestOptions = {
        method: "POST",
        headers: myHeaders,
        body: registerDetails,
        redirect: "follow",
      };

      fetch(`${URL}/api/users/register/`, requestOptions)
        .then((response) => {
          const data = response.json();
          setLoading(false);

          if (response.status == 200) setCreated(true);
          else setCreated(false);

          return data;
        })
        .then((result) => {
          console.log(result);

          let firstkey = Object.keys(result)[0];

          setError({
            status: true,
            body: result[firstkey],
          });
        })
        .catch((error) => console.log("error", error));
    } else {
      setError({
        status: true,
        body: "The passwords dont match!",
      });
    }
  };

  // Login handler
  const loginHandler = (e) => {
    e.preventDefault();
    setLoading(true);

    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");

    let authDetails = JSON.stringify({
      email: email,
      password: pass,
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: authDetails,
      redirect: "follow",
    };

    fetch(`${URL}/api/auth/login/`, requestOptions)
       .then((response) => {
        setLoading(false)
        if (response.ok) { 
          return response.json();
        }
        return Promise.reject(response); 
      })
      .then((result) => {
        authCtx.login(result.key);

        if (result.key) history.replace("/dashboard");

        let firstkey = Object.keys(result)[0];

        setWarning({
          status: true,
          body: result[firstkey],
        });

        if (result.key)
          setWarning({
            status: true,
            body: "Loggin successful",
          });
      })
      .catch((error) => {
        error.json().then((result)=>{
          let firstkey = Object.keys(result)[0];

          setWarning({
            status: true,
            body: result[firstkey],
          });
        });
      })
  };
  var width = Math.max(window.screen.width);
  console.log("mq", width);

  return (
    <div className="form-wrapper">
      <img
        src={typing}
        className={`${coverClass} ${width < 480 ? "display-none" : ""}`}
      />
      <div
        className={`login ${
          width < 480 && coverClass === "cover" ? "display-none" : ""
        }`}
      >
        <h1>Welcome back</h1>
        <p>
          New here?{" "}
          <a
            onClick={() => {
              setCoverClass("cover");
              setWarning({ status: false, body: "" });
              setError({ status: false, body: "" });
            }}
          >
            Create an account now!
          </a>
        </p>
        <form>
          <label>Email ID</label>
          <input
            type="text"
            required
            onChange={emailChangeHandler}
            value={email}
          />
          <label>Password</label>
          <input
            type="password"
            required
            onChange={passChangeHandler}
            value={pass}
          />
          <a className="forgot-password" onClick={forgetPasswordHandler}>
            Forgot password?
          </a>
          {warning.status ? (
            <span className="warning login-warning">{warning.body}</span>
          ) : null}
          <button type="submit" onClick={loginHandler}>
            Log in
          </button>
        </form>
      </div>
      <div className={`divider ${width < 480 ? "display-none" : ""}`}> </div>
      <div
        className={`register ${
          width < 480 && coverClass === "cover cover-register"
            ? "display-none"
            : ""
        }`}
      >
        <h1>Register Now</h1>
        <p>
          Existing User?{" "}
          <a
            onClick={() => {
              setCoverClass("cover cover-register");
              setWarning({ status: false, body: "" });
              setError({ status: false, body: "" });
            }}
          >
            Click here to login!
          </a>
        </p>
        <form>
          <label>Email ID</label>
          <input
            type="email"
            required
            required
            onChange={emailChangeHandler}
            value={email}
          />
          <label>Full Name</label>
          <input
            type="text"
            required
            onChange={nameChangeHandler}
            value={name}
          />
          <label>Password</label>
          <input
            type="password"
            required
            onChange={passChangeHandler}
            value={pass}
          />
          <label>Confirm Password</label>
          <input
            type="password"
            required
            onChange={pass2ChangeHandler}
            value={pass2}
          />
          {created ? (
            <span className="warning success">Account created! Please check your email and verify in order to login.</span>
          ) : error.status ? (
            <span className="warning error">{error.body}</span>
          ) : null}
          {loading ? (
            <div className="lds-ring">
              <div></div>
              <div></div>
              <div></div>
              <div></div>
            </div>
          ) : null}
          <button
            type="submit"
            className="registerBtn"
            onClick={registerHandler}
          >
            Register
          </button>
        </form>
      </div>
    </div>
  );
};

export default Login;
