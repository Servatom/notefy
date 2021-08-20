import Searchbar from "../components/Searchbar";
import NotesList from "../components/NotesList";
import "../assets/css/Dashboard.css";
import { useState, useEffect } from "react";
import {nanoid} from 'nanoid';
import SideNav from "../components/SideNav";
import logo from "../assets/media/logo.png";
import URL from "../URL";
import axios from "axios";

const Dashboard=(props)=>{
    
    const [notes, setNotes] = useState([
        // {
        //     id:nanoid(),
        //     text:"This is dummy note 1",
        //     date:"18/7/2021"
        // },
    ])
    
    let token;
    useEffect(()=>{
        token=props.token;
        console.log(token);
        
    },[])
    
    
    
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
        setNotes([newnote, ...notes]);
        axios.post()
    }

    
    const deleteNoteHandler =(id)=>
    {
        const newNotes = notes.filter((note)=>note.id!==id);
        setNotes(newNotes);
    }

    const editNoteHandler =(editedNote)=>
    {
        const newNotes = notes.filter((note)=>note.id!==editedNote.id);
        setNotes([editedNote, ...newNotes]);
    }

    const deleteAllNotes=()=>
    {
        setNotes([]);
    }

    const watermark =() =>
    {

        return(
            <div className="watermark">
            <img src={logo}/>
            <p>It feels so empty here ;( ... Add some notes!</p>
        </div>
        );
    }

    return(
        <div className="dashboard">
            <div className="side-nav">
                <SideNav deleteAll={deleteAllNotes}/>
            </div>
            <div className="cont">
                <Searchbar searchHandler={setSearchText}/>
                <NotesList notes={notes.filter((note)=>note.text.toLowerCase().includes(searchText))} addNew={newNoteHandler} deleteNote={deleteNoteHandler} editNote={editNoteHandler}/>
                {
                    !notes.length?
                    watermark()
                    :null
                }
            </div>
            
            
        </div>
    );
}

export default Dashboard;