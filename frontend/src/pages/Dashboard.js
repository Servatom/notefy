
import NotesList from "../components/NotesList";
import "../assets/css/Dashboard.css";
import { useState } from "react";
import {nanoid} from 'nanoid';

const Dashboard=()=>{
    
    const [notes, setNotes] = useState([
        {
            id:nanoid(),
            text:"This is dummy note 1",
            date:"18/07/2021"
        },
        {
            id:nanoid(),
            text:"This is dummy note 2",
            date:"19/07/2021"
        },
        {
            id:nanoid(),
            text:"This is dummy note 3",
            date:"20/07/2021"
        },
        {
            id:nanoid(),
            text:"This is dummy note 4",
            date:"20/07/2021"
        },
        {
            id:nanoid(),
            text:"This is dummy note 5",
            date:"20/07/2021"
        },
    ])
    
    return(
        <div className="dashboard">
            <div className="side-nav">
                <ul>
                    <li>Option 1</li>
                    <li>Option 2</li>
                    <li>Option 3</li>
                    <li>Option 4</li>
                </ul>
            </div>
            <NotesList notes={notes}/>
        </div>
    );
}

export default Dashboard;