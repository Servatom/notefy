import "../assets/css/Notes.css";
import { useState } from "react";
import {nanoid} from 'nanoid';

const AddNote=(props)=>{
    
    const [noteText, setNoteText] = useState("");
    const [wordcount, setWordCount] = useState(0);

    const changeHandler =(event)=>
    {
        setNoteText(event.target.value);
        setWordCount(noteText.length+1);
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

        setWordCount(0);
    }
}
    
    return(
        <div className="note addnote">
            <textarea placeholder="Add a new note" 
            onChange={changeHandler}
            value={noteText}/>
            <div className="note-footer">
                <small>{wordcount}</small>
                <button className="saveBtn" onClick={saveHandler}>Save</button>
            </div>
        </div>
    );
}

export default AddNote;