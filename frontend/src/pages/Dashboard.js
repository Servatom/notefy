import Searchbar from "../components/Searchbar";
import NotesList from "../components/NotesList";
import "../assets/css/Dashboard.css";
import { useState, useEffect } from "react";
import {nanoid} from 'nanoid';
import SideNav from "../components/SideNav";

const Dashboard=()=>{
    
    const [notes, setNotes] = useState([
        // {
        //     id:nanoid(),
        //     text:"This is dummy note 1",
        //     date:"18/7/2021"
        // },
    ])
    
    
    // retrievs saved notes on first run. only executes once coz no dependencies provided
    useEffect(() => {
        let savedNotes = JSON.parse(localStorage.getItem('notes-local'))
        
        if(savedNotes)
        setNotes(savedNotes);
    }, []);

    // stores notes to local storage whenever the notes list changes
    useEffect(() => {
        localStorage.setItem('notes-local',JSON.stringify(notes));
    }, [notes]);
    
    const [searchText, setSearchText]=useState("");
    
    const newNoteHandler =(newnote)=>
    {
        setNotes([...notes, newnote]);
    }

    
    const deleteNoteHandler =(id)=>
    {
        const newNotes = notes.filter((note)=>note.id!==id);
        setNotes(newNotes);
    }



    return(
        <div className="dashboard">
            <div className="side-nav">
                <SideNav/>
            </div>
            <div className="cont">
                <Searchbar searchHandler={setSearchText}/>
                <NotesList notes={notes.filter((note)=>note.text.toLowerCase().includes(searchText))} addNew={newNoteHandler} deleteNote={deleteNoteHandler}/>
            </div>
            
            
        </div>
    );
}

export default Dashboard;