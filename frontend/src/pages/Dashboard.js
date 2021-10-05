import Searchbar from "../components/Searchbar";
import NotesList from "../components/NotesList";
import "../assets/css/Dashboard.css";
import { useState, useEffect, useContext } from "react";
import { ImCross, ImMenu } from "react-icons/im";
import { HiMenu } from "react-icons/hi";
import { nanoid } from "nanoid";
import SideNav from "../components/SideNav";
import logo from "../assets/media/logo.png";
import URL from "../URL";
import AuthContext from "../store/auth-context";
import Settings from "../components/Settings";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

const Dashboard = (props) => {
    const [notes, setNotes] = useState([
        // {
        //     id:nanoid(),
        //     text:"This is dummy note 1",
        //     date:"18/7/2021"
        // },
    ]);
    const [isOpen, setIsOpen] = useState(false);
    const authCtx = useContext(AuthContext);

    useEffect(() => {
        // let savedNotes = JSON.parse(localStorage.getItem('notes-local'))

        // if(savedNotes)
        // setNotes(savedNotes);

        getNotes();
        getUserDetails();
    }, []);

    // stores notes to local storage whenever the notes list changes
    // useEffect(() => {
    //     localStorage.setItem('notes-local',JSON.stringify(notes));
    // }, [notes]);

    const [userInfo, setUserInfo] = useState({});
    const getUserDetails = () => {
        var myHeaders = new Headers();
        myHeaders.append("Authorization", "Token " + authCtx.token);

        var requestOptions = {
            method: "GET",
            headers: myHeaders,
            redirect: "follow",
        };

        fetch(
            `${URL}/api/users/detail/`,
            requestOptions
        )
            .then((response) => response.json())
            .then((result) => setUserInfo(result))
            .catch((error) => console.log("error", error));
    };

    const [searchText, setSearchText] = useState("");

    //new note handler
    const newNoteHandler = (newnote) => {
        // setNotes([newnote, ...notes]);
        var myHeaders = new Headers();
        myHeaders.append("Authorization", "Token " + authCtx.token);
        myHeaders.append("Content-Type", "application/json");

        var raw = JSON.stringify({
            title: "k",
            body: newnote.text,
        });

        var requestOptions = {
            method: "POST",
            headers: myHeaders,
            body: raw,
            redirect: "follow",
        };

        fetch(
            `${URL}/api/notes/create/`,
            requestOptions
        )
            .then((response) => response.text())
            .then((result) => {
                getNotes();
            })
            .catch((error) => console.log("error", error));
    };

    //fetching notes from database
    const getNotes = () => {
        var myHeaders = new Headers();
        myHeaders.append("Authorization", "Token " + authCtx.token);

        var requestOptions = {
            method: "GET",
            headers: myHeaders,
            redirect: "follow",
        };

        fetch(`${URL}/api/notes/`, requestOptions)
            .then((response) => response.json())
            .then((result) => setNotes(result))
            .catch((error) => console.log("error", error));
    };

    //deleting notes
    const deleteNoteHandler = (id) => {
        // const newNotes = notes.filter((note)=>note.id!==id);
        // setNotes(newNotes);

        var myHeaders = new Headers();
        myHeaders.append("Authorization", "Token " + authCtx.token);

        var requestOptions = {
            method: "DELETE",
            headers: myHeaders,
            redirect: "follow",
        };

        fetch(`${URL}/api/notes/${id}/`, requestOptions)
            .then((response) => {
                // console.log(response.status);
                getNotes();
            })
            .catch((error) => console.log("error", error));
    };

    //editing note
    const editNoteHandler = (editedNote) => {
        // const newNotes = notes.filter((note)=>note.id!==editedNote.id);
        // setNotes([editedNote, ...newNotes]);

        var myHeaders = new Headers();
        myHeaders.append("Authorization", "Token " + authCtx.token);
        myHeaders.append("Content-Type", "application/json");

        var raw = JSON.stringify({
            title: "k",
            body: editedNote.text,
        });

        var requestOptions = {
            method: "PUT",
            headers: myHeaders,
            body: raw,
            redirect: "follow",
        };

        fetch(
            `${URL}/api/notes/${editedNote.id}/`,
            requestOptions
        )
            .then((response) => {
                getNotes();
                return response.json();
            })
            .then((result) => console.log(result))
            .catch((error) => console.log("error", error));
    };

    const deleteAllNotes = () => {
        notes.map((note) => {
            deleteNoteHandler(note.id);
        });
        getNotes();
    };

    const watermark = () => {
        return (
            <div className="watermark">
                <img src={logo} />
                <p>It feels so empty here ;( ... Add some notes!</p>
            </div>
        );
    };

    const [currentTab, setCurrentTab] = useState(1);

    return (
        <>
            <div
                onClick={() => {
                    setIsOpen(!isOpen);
                }}
                className="nav-menu"
            >
                {isOpen ? (
                    <ImCross className="nav-menu-icon" />
                ) : (
                    <HiMenu className="nav-menu-icon" />
                )}
            </div>
            <div className="dashboard">
                <div className={isOpen ? 'side-nav-open' : 'side-nav'}>
                    <SideNav
                        deleteAll={deleteAllNotes}
                        setCurrentTab={setCurrentTab}
                        currentTab={currentTab}
                        closeNav = {()=>{setIsOpen(false)}}
                    />
                </div>
                <div className="cont">
                    <Switch>
                        <Route exact path="/dashboard">
                            <Searchbar searchHandler={setSearchText} />
                            <NotesList
                                notes={notes.filter((note) =>
                                    note.body.toLowerCase().includes(searchText)
                                )}
                                addNew={newNoteHandler}
                                deleteNote={deleteNoteHandler}
                                editNote={editNoteHandler}
                            />
                            {!notes.length ? watermark() : null}
                        </Route>
                        <Route path={"/dashboard/settings"}>
                            <Settings
                                userInfo={userInfo}
                                setUserInfo={setUserInfo}
                            />
                        </Route>
                    </Switch>
                </div>
                {/* <div className='cont'>
        {currentTab === 1 ? (
          <>
            <Searchbar searchHandler={setSearchText} />
            <NotesList
              notes={notes.filter((note) =>
                note.body.toLowerCase().includes(searchText)
              )}
              addNew={newNoteHandler}
              deleteNote={deleteNoteHandler}
              editNote={editNoteHandler}
            />
            {!notes.length ? watermark() : null}
          </>
        ) : (
          <Settings userInfo={userInfo} setUserInfo={setUserInfo} />
        )}
      </div> */}
            </div>
        </>
    );
};

export default Dashboard;
