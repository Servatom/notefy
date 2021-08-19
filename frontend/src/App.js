import './App.css';
import LandingPage from './pages/LandingPage';
import Auth from "./pages/Auth";
import {BrowserRouter as Router, Route, Switch, Redirect} from 'react-router-dom';

import Dashboard from './pages/Dashboard';
import { useState } from 'react';

function App() {

  const [loggedIn, setLoggedin] = useState(false);

  return (
    <Router>
      <Switch>
        
        <Route exact path="/">
          {loggedIn ? <Redirect to="/dashboard" /> : <LandingPage onLogin={setLoggedin}/>}
        </Route>
        <Route path="/auth" exact>
          <Auth/>
        </Route>
        
        <Route path="/dashboard" exact>
          <Dashboard />
        </Route>
      </Switch>
    </Router>
    
  );
}

export default App;
