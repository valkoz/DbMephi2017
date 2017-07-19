CREATE TYPE doc_status AS ENUM ('rejected', 'sent for revision', 'ready to publish');
CREATE TYPE subject_enum AS ENUM('venal practice','murder','spy','violution of human rightes','war crime', 'child abuse ', 'genocide', 'kidnapping', 'riot', 'another');
CREATE TYPE spec AS ENUM('paparazzi','undercover agent','freelancer','spy','another');
CREATE TYPE doc_type AS ENUM('jpg','png','xls','doc','docx','mov','avi','mp3','pdf');
ALTER TYPE doc_type ADD VALUE 'pdf' AFTER 'mp3';


CREATE TABLE authors(
Author_ID serial PRIMARY KEY,
Nickname varchar(15) NOT NULL UNIQUE,
Password_hash char(64) NOT NULL UNIQUE,
Subject subject_enum,
Block_Status boolean NOT NULL DEFAULT FALSE
CHECK (Nickname ~ '[A-Za-z0-9_ ]*')
);

CREATE TABLE users(
User_ID serial PRIMARY KEY,
Login varchar(15) NOT NULL UNIQUE,
Password_hash char(64) NOT NULL UNIQUE,
VIP_Status boolean NOT NULL DEFAULT FALSE,
Block_Status boolean NOT NULL DEFAULT FALSE
CHECK (Login ~ '[A-Za-z0-9_ ]*')
);

CREATE TABLE informers(
Informer_ID serial PRIMARY KEY,
Nickname varchar(15) NOT NULL UNIQUE,
Specialization spec NOT NULL,
CHECK (Nickname ~ '[A-Za-z0-9_ ]*')
);

CREATE TABLE docs(
Document_ID serial PRIMARY KEY,
Name varchar(40) NOT NULL UNIQUE,
Author_ID integer REFERENCES authors NOT NULL,
CoAuthor_ID integer REFERENCES authors,
Status doc_status NOT NULL,
Type doc_type NOT NULL,
Subject subject_enum,
Info char(28) NOT NULL
CHECK(Author_ID != CoAuthor_ID)
CHECK (Name ~ '[A-Za-z0-9 .,&?!]*')
);

CREATE TABLE authors_base(
ID serial PRIMARY KEY,
Author_ID integer NOT NULL REFERENCES authors ON DELETE CASCADE,
Ip inet NOT NULL,
UNIQUE(Ip, Author_ID)
);

CREATE TABLE users_base(
ID serial PRIMARY KEY,
User_ID integer NOT NULL REFERENCES users ON DELETE CASCADE,
Ip inet NOT NULL,
UNIQUE(Ip, User_ID)
);

CREATE TABLE favourites(
User_ID integer NOT NULL REFERENCES users ON DELETE CASCADE,
Document_ID integer NOT NULL REFERENCES docs ON DELETE CASCADE,
PRIMARY KEY (User_ID, Document_ID)
);

CREATE TABLE history(
User_ID integer NOT NULL REFERENCES users ON DELETE CASCADE,
Document_ID integer NOT NULL REFERENCES docs ON DELETE CASCADE,
Date timestamp NOT NULL,
Subject subject_enum,
PRIMARY KEY (User_ID, Document_ID, Date)
);

CREATE TABLE info(
Info_ID serial PRIMARY KEY,
Informer_ID integer NOT NULL REFERENCES informers,
Author_ID integer REFERENCES authors,
Info varchar(28) NOT NULL,
Type doc_type NOT NULL
);