import {React,useState,useEffect} from 'react'
import logo from '../assets/media/logo.png';
import '../assets/css/EmailVerify.css';
import { useParams,useHistory } from 'react-router';
import URL from '../URL';

function EmailVerify() {
    let { token } = useParams();

    const history = useHistory();

    const routeChange = () =>{ 
        history.push('/');
    }


    const [isLoaded, setIsLoaded] = useState(false)
    const [isValid,setIsValid]=useState(false)

    //make get request to api
    useEffect(() => {
    fetch(`${URL}/api/users/email-verify/${token}`)
      .then(result => {
                if (!result.ok) throw result;
                return result.json();
            })
      .then(
        (result) => {
          setIsLoaded(true);
          setIsValid(true);
          console.log(result);
        },
        (error) => {
          setIsLoaded(true);
          setIsValid(false);
        }
      )
  }, [])

    return (
    <>
        <div class="verify-cont">
            <div className='navhead'>
                <h1 className='heading'>notefy</h1>
                <img src={logo} className='navlogo' />
            </div>
            {isLoaded?
            <div class="msg-container">
            { isValid?
            <>
            <p class='success-msg msg'>Your email has been verified successfully. Now you can login..!</p>
            <button class="redirect-btn" onClick={routeChange}>Login</button></>:
            <>
            <p class='warning-msg msg'>Sorry, Invalid Request...!</p>
            <button class="redirect-btn" onClick={routeChange}>Go Home</button>
            </>}
            </div>:<></>}
        </div>
        <div className='email-watermark'>
        <img src={logo} />
        <p>We welcome you to notefy(:!</p>
      </div>
        </>
    )
}

export default EmailVerify
