import "../../assets/css/Notes.css";
import AddNote from "./AddNote";
import Note from "./Note";

const NotesList =(props) =>
{
    
    let sortedNotes = props.notes.sort((a,b)=>{
        let db = b.updated_at;
        let da =  a.updated_at;
        if (da > db) {
            return -1;
        }
        if (da < db) {
            return 1;
        }
        return 0;
    });
    
    return(
        
            <div className="notes-list">    
                <AddNote onSave={props.addNew} countPreference={props.countPreference}/>
                {
                    sortedNotes.map((note)=>{
                        return(<Note key={note.id} note={note} onDelete={props.deleteNote} onEdit={props.editNote} countPreference={props.countPreference} />)
                    })
                } 
            </div>
        
    );
}

export default NotesList;