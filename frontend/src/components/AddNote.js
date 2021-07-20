import "../assets/css/Notes.css";
import { useState } from "react";


const AddNote=()=>{
    
    const [noteText, setNoteText] = useState(" ");

    const changeHandler =(event)=>
    {
        setNoteText(event.target.value);
    }

    
    return(
        <div className="note addnote">
            <textarea placeholder="Add a new note" onChange={changeHandler}></textarea>
            <div className="note-footer">
                <small>hjbjhbj</small>
                <button className="saveBtn">Save</button>
            </div>
        </div>
    );
}

export default AddNote;