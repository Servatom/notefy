import logo from './logo.svg';
import './App.css';
import LandingPage from './pages/LandingPage';
import Auth from "./pages/Auth";
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Dashboard from './pages/Dashboard';

function App() {
  return (
    <Router>
      <Switch>
        
        <Route path="/" exact>
          <LandingPage/>
        </Route>
        
        <Route path="/auth" exact>
          <Auth/>
        </Route>
        
        <Route path="/dashboard" exact>
          <Dashboard/>
        </Route>
      </Switch>
    </Router>
    
  );
}

export default App;
