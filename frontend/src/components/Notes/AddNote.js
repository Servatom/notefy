import "../../assets/css/Notes.css";
import { useState } from "react";
import {nanoid} from 'nanoid';

const AddNote=(props)=>{
    
    const [noteText, setNoteText] = useState("");

    const changeHandler =(event)=>
    {
        setNoteText(event.target.value);
    }
const saveHandler=()=>
{
    if(noteText)
    {

        let date= new Date;
        const day = date.getDate();
        const month = date.getMonth() + 1;
        const year = date.getFullYear();

        let newnote={

            text: noteText,
            // date: day+"/"+month+"/"+year
        };
        props.onSave(newnote);
        setNoteText("");
    }
}
    
    return(
        <div className="note addnote">
            <textarea placeholder="Add a new note" 
            onChange={changeHandler}
            value={noteText}/>
            <div className="note-footer">
                <small>{noteText.length}</small>
                <button className="saveBtn" onClick={saveHandler}>Save</button>
            </div>
        </div>
    );
}

export default AddNote;