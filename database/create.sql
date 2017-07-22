-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-07-19 23:20:57.192

CREATE SCHEMA IF NOT EXISTS futbolpools;
set schema 'futbolpools';;

-- tables
-- Table: GAME
CREATE TABLE GAME (
    GAME_ID int  NOT NULL,
    team_choice varchar(255)  NOT NULL,
    confidence int  NOT NULL,
    points int  NOT NULL,
    SLATE_ID int  NOT NULL,
    CONSTRAINT confCheck CHECK (confidence >= 1 and confidence <= 10) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT pointsCheck CHECK (points >= -10 and confidence <= 10) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT GAME_pk PRIMARY KEY (GAME_ID)
);

-- Table: LOGIN
CREATE TABLE LOGIN (
    LOGIN_ID int  NOT NULL,
    username varchar(255)  NULL,
    password varchar(255)  NULL,
    contactKey varchar(255)  NOT NULL,
    isValidated boolean  NOT NULL,
    createdAt timestamp  NULL,
    modifedAt timestamp  NULL,
    CONSTRAINT LOGIN_pk PRIMARY KEY (LOGIN_ID)
);

-- Table: PERSON
CREATE TABLE PERSON (
    PERSON_ID int  NOT NULL,
    first_name varchar(255)  NOT NULL,
    last_name varchar(255)  NOT NULL,
    email varchar(255)  NULL,
    mobile varchar(255)  NULL,
    LOGIN_ID int  NOT NULL,
    CONSTRAINT PERSON_pk PRIMARY KEY (PERSON_ID)
);

-- Table: PERSON_TEAM
CREATE TABLE PERSON_TEAM (
    PERSON_TEAM_ID int  NOT NULL,
    PERSON_ID int  NOT NULL,
    TEAM_ID int  NOT NULL,
    CONSTRAINT PERSON_TEAM_pk PRIMARY KEY (PERSON_TEAM_ID)
);

-- Table: SLATE
CREATE TABLE SLATE (
    SLATE_ID int  NOT NULL,
    week_name varchar(255)  NOT NULL,
    wins int  NOT NULL,
    losses int  NOT NULL,
    ties int  NOT NULL,
    points int  NOT NULL,
    TEAM_ID int  NOT NULL,
    CONSTRAINT winsCheck CHECK (wins >= 0 and wins <= 10) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT lossesCheck CHECK (losses >= 0 and losses <= 10) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT tiesCheck CHECK (ties >= 0 and ties <= 10) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT pointsCheck CHECK (ties >= -65 and ties <= 165) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT SLATE_pk PRIMARY KEY (SLATE_ID)
);

-- Table: TEAM
CREATE TABLE TEAM (
    TEAM_ID int  NOT NULL,
    team_name varchar(255)  NOT NULL,
    wins int  NOT NULL,
    losses int  NOT NULL,
    ties int  NOT NULL,
    points int  NOT NULL,
    pictureURL varchar(255)  NULL,
    CONSTRAINT TEAM_pk PRIMARY KEY (TEAM_ID)
);

-- foreign keys
-- Reference: LOGIN_PERSON (table: PERSON)
ALTER TABLE PERSON ADD CONSTRAINT LOGIN_PERSON
    FOREIGN KEY (LOGIN_ID)
    REFERENCES LOGIN (LOGIN_ID)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: PERSON_TEAM_PERSON (table: PERSON_TEAM)
ALTER TABLE PERSON_TEAM ADD CONSTRAINT PERSON_TEAM_PERSON
    FOREIGN KEY (PERSON_ID)
    REFERENCES PERSON (PERSON_ID)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: SLATE_GAME (table: GAME)
ALTER TABLE GAME ADD CONSTRAINT SLATE_GAME
    FOREIGN KEY (SLATE_ID)
    REFERENCES SLATE (SLATE_ID)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: TEAM_PERSON_TEAM (table: PERSON_TEAM)
ALTER TABLE PERSON_TEAM ADD CONSTRAINT TEAM_PERSON_TEAM
    FOREIGN KEY (TEAM_ID)
    REFERENCES TEAM (TEAM_ID)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: TEAM_SLATE (table: SLATE)
ALTER TABLE SLATE ADD CONSTRAINT TEAM_SLATE
    FOREIGN KEY (TEAM_ID)
    REFERENCES TEAM (TEAM_ID)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.