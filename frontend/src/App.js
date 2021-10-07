import './App.css';
import LandingPage from './pages/LandingPage';
import Auth from './pages/Auth';
import EmailVerify from './pages/EmailVerify';
import {
  BrowserRouter as Router,
  Route,
  Switch,
  Redirect,
} from 'react-router-dom';

import Dashboard from './pages/Dashboard';
import { useContext, useEffect, useState } from 'react';
import AuthContext from './store/auth-context';
import Modal from './components/Alert';
import URL from './URL';


function App() {
  const authCtx = useContext(AuthContext);
  const [key, setKey] = useState();
  const [isError, setIsError] = useState(false)

  useEffect(()=>{

    var requestOptions = {
      method: 'GET',
      redirect: 'follow'
    };
    
    fetch(`${URL}/`, requestOptions)
      .then(response => {
        if(response.status!==404)
        {
          setIsError(true)
        }
        else
        {
          setIsError(false)
        }
        console.log(response);
        return response;
      })
      .catch(error => {
        console.log(!!error)
        if(error)
        {
          setIsError(true)
        }
        else
        {
          setIsError(false)
        }
      });
  },[])

  return (
    <Router>
      <Switch>

        <Route exact path='/'>
          {authCtx.isLoggedIn ? <Redirect to='/dashboard' /> :<LandingPage isError={isError} setIsError={setIsError} />
          }
        </Route>

        {authCtx.isLoggedIn && (
          <Route path='/dashboard'>
            <Dashboard isError={isError} setIsError={setIsError}/>
          </Route>
        )}

        {!authCtx.isLoggedIn && (
          <Route path='/' exact>
            <LandingPage />
          </Route>
        )}
        <Route path='/email-verify/:token'>
            <EmailVerify />
        </Route>

        <Route path='*'>
          <Redirect to='/' />
        </Route>
      </Switch>
    </Router>
  );
}

export default App;
