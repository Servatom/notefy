import './App.css';
import LandingPage from './pages/LandingPage';
import Auth from "./pages/Auth";
import {BrowserRouter as Router, Route, Switch, Redirect} from 'react-router-dom';

import Dashboard from './pages/Dashboard';
import { useContext, useEffect, useState } from 'react';
import AuthContext from './store/auth-context';

function App() {

  const authCtx = useContext(AuthContext);
  const [key, setKey] = useState();

  console.log(key);

  return (
    <Router>
      <Switch>
        
      <Route exact path="/">
          { authCtx.isLoggedIn?
          <Redirect to="/dashboard"/>
          :<LandingPage/>}
        </Route>
        
        {authCtx.isLoggedIn && (
        <Route path="/dashboard" exact>
          <Dashboard />
        </Route>)}

        {!authCtx.isLoggedIn && (
        <Route path="/" exact>
          <LandingPage />
        </Route>)}


        <Route path="*">
          <Redirect to="/"/>
        </Route>

      </Switch>
    </Router>
    
  );
}

export default App;
