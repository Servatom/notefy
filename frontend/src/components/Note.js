import "../assets/css/Notes.css";
import { MdDeleteSweep, MdEdit} from 'react-icons/md';
import swal from 'sweetalert';
import { useState } from "react";
import ExpandNote from "./ExpandNote";


const Note =(props) =>{
    
  const [isExpansed, setIsExpanded] = useState(false);
    const deleteHandler=()=>{
        swal({
            title: "Are you sure?",
            text: "Once deleted, you cannot recover this note!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          })
          .then((willDelete) => {
            if (willDelete) 
            {
            props.onDelete(props.note.id); 
            noteMinimiser();
            } 
            // else 
            // {
            //   swal("Your note is safe!");
            // }
          });
    }
    
    
    
    const noteExpander=()=>{
      setIsExpanded(true);
    }
    
    const noteMinimiser=()=>{
      setIsExpanded(false);
      setEdit(false);
    }


    const [edit, setEdit]=useState(false);

    const editHandler=()=>{
        
      setIsExpanded(true);
      setEdit(true);

    }

    return(
        <>
        <div className="note" >
          <div className="noteText" onClick={noteExpander}>
          <p>{props.note.text}</p>
          </div>
            
            <div className="note-footer">
                <small>{props.note.date}</small>
                <div>
                  <MdEdit className="edit-icon" onClick={editHandler} />
                  <MdDeleteSweep className="delete-icon" onClick={deleteHandler}/>
                </div>
                
            </div>
        </div>
        {
          isExpansed?
          <ExpandNote note={props.note} deleteHandler={deleteHandler} onClose={noteMinimiser} onEdit={editHandler} isEdit={edit}/>
          :null
          }
        </>
    );
}

export default Note;