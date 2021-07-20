import "../assets/css/Sidenav.css";
import MoonToggle from "./MoonToggle";
import logo from "../assets/media/logo.png";
import {MdDashboard, MdSettings} from 'react-icons/md';
import {IoLogOut} from 'react-icons/io5';

const SideNav =()=>
{
    return(
        <div className="sidenav">
            <div className="navhead">
                <h2 className="heading">notefy</h2>
                <img src={logo} className="navlogo"/>
            </div>
            
            
            <a><h4 className="active"><MdDashboard className="icon"/>Dashboard</h4></a>
            <a><h4><MdSettings className="icon"/>Settings</h4></a>
            <a><h4><IoLogOut className="icon"/>Logout</h4></a>
            <MoonToggle className="moonNav"/>
        </div>
        
    );
}

export default SideNav;