import "../assets/css/Notes.css";
import { MdDeleteSweep} from 'react-icons/md';
import swal from 'sweetalert';
import { useState } from "react";


const Note =(props) =>{
    
    
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
              swal("Poof! Your note has been deleted!", {
                icon: "success",
              });
            props.onDelete(props.note.id); 
            } 
            else 
            {
              swal("Your note is safe!");
            }
          });
    }
    
    
    return(
        <div className="note">
            <p>{props.note.text}</p>
            <div className="note-footer">
                <small>{props.note.date}</small>
                <MdDeleteSweep className="delete-icon" onClick={deleteHandler}/>
            </div>
        </div>
    );
}

export default Note;