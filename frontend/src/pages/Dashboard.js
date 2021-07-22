import Searchbar from "../components/Searchbar";
import NotesList from "../components/NotesList";
import "../assets/css/Dashboard.css";
import { useState } from "react";
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