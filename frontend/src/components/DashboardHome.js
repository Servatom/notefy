import React, { Fragment } from 'react';

const DashboardHome = () => {
  return (
    <Fragment>
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
    </Fragment>
  );
};

export default DashboardHome;
