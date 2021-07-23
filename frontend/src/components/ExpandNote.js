import {GrClose} from 'react-icons/gr';
import { MdDeleteSweep} from 'react-icons/md';

const ExpandNote=(props)=>{
    return(
        <div className="note expanded">
            <GrClose className="close-icon" onClick={props.onClose}/>
          <div className="noteText">
          <p>{props.note.text}</p>
          </div>
            
            <div className="note-footer">
                <small>{props.note.date}</small>
                <MdDeleteSweep className="delete-icon" onClick={props.deleteHandler}/>
            </div>
        </div>
    );
}

export default ExpandNote;