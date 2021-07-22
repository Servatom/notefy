import "../assets/css/Notes.css";
import AddNote from "./AddNote";
import Note from "./Note";

const NotesList =(props) =>
{
    return(
        
            <div className="notes-list">    
                <AddNote onSave={props.addNew}/>
                {
                    props.notes.map((note)=>{
                        return(<Note note={note} onDelete={props.deleteNote}/>)
                    })
                } 
            </div>
        
    );
}

export default NotesList;