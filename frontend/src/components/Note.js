import "../assets/css/Notes.css";
import {MdDeleteForever} from 'react-icons/md';

const Note =(props) =>{
    return(
        <div className="note">
            <p>{props.note.text}</p>
            <div className="note-footer">
                <small>{props.note.date}</small>
                <MdDeleteForever className="delete-icon"/>
            </div>
        </div>
    );
}

export default Note;