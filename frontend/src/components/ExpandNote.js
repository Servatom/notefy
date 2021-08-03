import { useState } from 'react';
import {GrClose} from 'react-icons/gr';
import { MdDeleteSweep, MdEdit} from 'react-icons/md';

const ExpandNote=(props)=>{
    
    
    const [noteText, setNoteText] = useState(props.note.text);
    const [wordcount, setWordCount] = useState(noteText.length);
    const [edit, setEdit] = useState(props.isEdit);
    
    
    const EditText =()=>{
        if(edit==false)
        return(<p>{noteText}</p>);
        else
        return(<textarea placeholder="Add a new note" value={noteText} onChange={changeHandler}/>)
    }
    
    
    const EditFooter =()=>{
        if(edit==false)
        return(
                <>
                <small>{props.note.date}</small>
                <div>
                    <MdEdit className="edit-icon-expanded" style={{marginRight:"30px"}} onClick={()=>{setEdit(true)}}/>
                    <MdDeleteSweep className="delete-icon" onClick={props.deleteHandler}/>
                </div>
                </>
        );
        else
        return(
            <>
                <small>{wordcount}</small>
                <button className="saveBtn" onClick={saveHandler}>Save</button>
            </>
        )
    }


    const changeHandler =(event)=>
    {
        setNoteText(event.target.value);
        setWordCount(noteText.length+1);
    }

    const saveHandler=()=>{

        let date= new Date;
        const day = date.getDate();
        const month = date.getMonth() + 1;
        const year = date.getFullYear();

        const editedNote = 
        {
            id:props.note.id,
            text: noteText,
            date: day+"/"+month+"/"+year
        }
        props.editHandler(editedNote);
        setEdit(!edit);
    }
    
    return(
        <div className="note expanded">
            <GrClose className="close-icon" onClick={props.onClose}/>
          <div className="noteText">
          {
             EditText()
        }
          </div>
            
            <div className="note-footer">
                {
                    EditFooter()
                }
            </div>
        </div>
    );
}

export default ExpandNote;