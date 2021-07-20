
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
        // {
        //     id:nanoid(),
        //     text:"This is dummy note 2",
        //     date:"19/7/2021"
        // },
        // {
        //     id:nanoid(),
        //     text:"This is dummy note 3",
        //     date:"20/7/2021"
        // },
        // {
        //     id:nanoid(),
        //     text:"This is dummy note 4",
        //     date:"20/7/2021"
        // },
        // {
        //     id:nanoid(),
        //     text:"This is dummy note 5",
        //     date:"20/7/2021"
        // },
    ])
    

    const newNoteHandler =(newnote)=>
    {
        setNotes([...notes, newnote]);
    }

    return(
        <div className="dashboard">
            <div className="side-nav">
                <SideNav/>
            </div>
            <NotesList notes={notes} addNew={newNoteHandler}/>
            
        </div>
    );
}

export default Dashboard;