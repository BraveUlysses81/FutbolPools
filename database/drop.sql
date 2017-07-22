-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-07-19 23:20:57.192

-- foreign keys
ALTER TABLE PERSON
    DROP CONSTRAINT LOGIN_PERSON;

ALTER TABLE PERSON_TEAM
    DROP CONSTRAINT PERSON_TEAM_PERSON;

ALTER TABLE GAME
    DROP CONSTRAINT SLATE_GAME;

ALTER TABLE PERSON_TEAM
    DROP CONSTRAINT TEAM_PERSON_TEAM;

ALTER TABLE SLATE
    DROP CONSTRAINT TEAM_SLATE;

-- tables
DROP TABLE GAME;

DROP TABLE LOGIN;

DROP TABLE PERSON;

DROP TABLE PERSON_TEAM;

DROP TABLE SLATE;

DROP TABLE TEAM;

-- End of file.

