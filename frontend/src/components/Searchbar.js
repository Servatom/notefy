import { useState } from 'react';
import {GoSearch} from 'react-icons/go';
import "../assets/css/Searchbar.css";
const Searchbar =(props)=>
{
    
    return(
        <div className="searchBar">
            <GoSearch className="search-icon"/>
            <input 
            type="text" 
            className="searchinput" 
            placeholder="Search for a note..."
            onChange={(event)=>props.searchHandler(event.target.value)}
            />
        </div>
    );
}

export default Searchbar;