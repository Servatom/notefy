import { React, useState, useEffect } from "react";
import { MdAddCircleOutline } from "react-icons/md";

function Todo() {
  const [addNote, setAddNote] = useState([]);
  const [noteText, setNoteText] = useState("");
  const [model, setModel] = useState(false);
  const days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  const today = days[new Date().getDay()];

  useEffect(() => {
          AddNotes();
      
  }, [model])

  const AddNotes = () => {

      if (model) {
        console.log(noteText, model)
        const changeHandler = (e) => {
            setNoteText(e.target.value);
          };
      
          console.log(addNote);
          const saveHandler = () => {
            if (noteText) {
              setAddNote([...addNote, noteText]);
              setModel(false);
              setNoteText("");
            }
          };
      return (
        <div className="note addnote">
          <textarea
            placeholder="Add a new note"
            onChange={changeHandler}
            value={noteText}
          />
          <div className="note-footer">
            <button className="saveBtn" onClick={saveHandler}>
              Save
            </button>
          </div>
        </div>
      );
    } else return "";
  };

  const toggleModel = () => {
      setModel(true);
  }

  return (
    <div>
      <h1>{today}</h1>
      <div id="todos">
        {addNote.map((note,idx) => {
          return (<label style={{display: "flex"}} key={idx} ><input type="checkbox" value={note} />  {note}</label> );
        })}
      </div>
      <AddNotes />
      <div>
        <MdAddCircleOutline className="icons" onClick={toggleModel} />
      </div>
    </div>
  );
}

export default Todo;
