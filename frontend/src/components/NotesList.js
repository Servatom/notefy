import "../assets/css/Notes.css";
import AddNote from "./AddNote";
import Note from "./Note";

const NotesList =(props) =>
{
    return(
        <div className="notes-list">
            {
                props.notes.map((note)=>{
                    return(<Note note={note}/>)
                })
            }
            <AddNote/>
        </div>
    );
}

export default NotesList;