SELECT DATABASE;

DATABASE CHESS; -- use chess

MODIFY USER DBC AS DEFAULT DATABASE = DBC;

CREATE USER "PUBLIC" -- superset of databse
    
    FROM "DBC" AS
    PASSWORD  =  "****",
    PERMANENT = 0,
    SPOOL = 39662995374,
    TEMPORARY = 39662995374,
    ACCOUNT = 'DBC',
    NO FALLBACK,
    NO BEFORE JOURNAL,
    NO AFTER JOURNAL;
 
CREATE DATABASE "SQLJ" -- subset of user
    
    FROM "DBC" AS
    PERMANENT = 6400000,
    SPOOL = 39662995374,
    TEMPORARY = 39662995374,
    ACCOUNT = 'DBC',
    FALLBACK,
    NO BEFORE JOURNAL,
    NO AFTER JOURNAL;
    
 -- Practice DDL
 CREATE DATABASE CHESS
    FROM DBC AS 
    PERM = 1000000000
    SPOOL= 39662995374;
        
CREATE DATABASE "CHESS"
    FROM "DBC" AS
    PERMANENT = 1000000000,
    SPOOL = 39662995374,
    TEMPORARY = 39662995374,
    ACCOUNT = 'DBC',
    FALLBACK,
    NO BEFORE JOURNAL,
    NO AFTER JOURNAL;

-- Create a table in CHESS 1
SELECT *
    FROM dbc.accounts;

DROP TABLE CHESS.accounts;

CREATE TABLE CHESS.accounts AS dbc.accounts WITH
    DATA;
    
CREATE TABLE CHESS.accounts AS dbc.accounts WITH
    NO DATA;
	
SHOW TABLE chess.accounts;

-- Create a table in CHESS 2
DROP TABLE CHESS.parents;

CREATE TABLE CHESS.parents AS (
    SELECT *
        FROM dbc.parents) WITH DATA;

SELECT *
    FROM chess.parents;
    
DELETE
    FROM CHESS.parents;

-- Create a table in CHESS 3
CREATE TABLE CHESS.sample_table
    ,FALLBACK
    ,NO BEFORE JOURNAL
    ,NO AFTER JOURNAL
    (
    phonenum CHAR(10) TITLE 'Number' NOT NULL,
    Name
    CHAR(25)
    TITLE 'Name' NOT NULL,
    LType CHAR(4) TITLE 'Line Type',
    Calls INTEGER
    TITLE 'Calls Made' FORMAT 'zzz9',
    Take CHAR(1)
    TITLE 'Important'
    )
    UNIQUE PRIMARY INDEX( phonenum );


SHOW TABLE CHESS.sample_table;


-- Data Type
CREATE SET TABLE CHESS.sample_table ,FALLBACK , -- set: no duplicates
    NO BEFORE JOURNAL, -- disaster recovery
    NO AFTER JOURNAL, -- disaster recovery
    CHECKSUM = DEFAULT,
    DEFAULT MERGEBLOCKRATIO,
    FREESPACE = 20 PERCENT,
    MAP = TD_MAP1
    (
    phonenum CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC TITLE 'Number' NOT NULL,
    Name CHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC TITLE 'Name' NOT NULL,
    LType CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC TITLE 'Line Type',
    Calls INTEGER FORMAT 'zzz9' TITLE 'Calls Made',
    Take CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC TITLE 'Important')
    UNIQUE PRIMARY INDEX ( phonenum );
  
DROP TABLE chess.sample_table;

CREATE SET TABLE chess.sample_table
    (
    id INT,
    balance DEC(6,2),
    languge CHAR(2),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    logon_date DATE
    );

SHOW TABLE chess.sample_table;

-- There is no TRUNCATE command in Teradata.
DELETE FROM sample_table;

INSERT INTO chess.sample_table VALUES(1, 500.26, 'English', 'Perry', 'Liu', CURRENT_DATE);
INSERT INTO chess.sample_table VALUES(2, 678.3678, 'Chinese', 'Zhicheng', 'Liu', CURRENT_DATE);

SELECT *
    FROM chess.sample_table;

-- 1, Derived Table
SELECT *
    FROM dbc.tables
    WHERE databasename IN 
    (
    SELECT databasename
        FROM dbc.databases
        WHERE permspace<1000000000);

-- 2, Volatile Table (Temporary Table)
CREATE VOLATILE TABLE my_volatile AS (
    SELECT databasename
        FROM dbc.databases
        WHERE permspace<1000000000) WITH DATA
    ON COMMIT PRESERVE ROWS;

SHOW TABLE my_volatile;

CREATE SET VOLATILE TABLE DBC.my_volatile ,FALLBACK ,
    CHECKSUM = DEFAULT,
    DEFAULT MERGEBLOCKRATIO,
    MAP = TD_DATADICTIONARYMAP,
    LOG
    ( DatabaseName CHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC)
    PRIMARY INDEX ( DatabaseName )
    ON COMMIT PRESERVE ROWS;

SELECT *
    FROM my_volatile;
    
-- 3, Global Temporary Table
CREATE GLOBAL TEMPORARY TABLE CHESS.my_global AS (
    SELECT databasename
        FROM dbc.databases
        WHERE permspace<1000000000
    )WITH DATA
    ON COMMIT PRESERVE ROWS;

    
-- Assignment
CREATE TABLE CHESS.Players(
    FIDE_ID INTEGER NOT NULL,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Country CHAR(3),
    Gender CHAR(1) UPPERCASE,
    Rating SMALLINT,
    Birth_Year SMALLINT,
    "Title" VARCHAR(3) UPPERCASE, -- Title is a special word so that have to use quote
    Inactive_IND CHAR(1)
    )
    PRIMARY INDEX ( FIDE_ID );


CREATE SET TABLE chess.Countries(
    Country_CD CHAR(3) NOT NULL,
    Country_Name VARCHAR(100) NOT NULL,
    Continent VARCHAR(10)
    )
    PRIMARY INDEX( Country_CD );

CREATE SET TABLE chess.Games(
    Event_ID INT,
    Event_Name VARCHAR(100),
    Site VARCHAR(50),
    Game_Date DATE,
    Game_Round VARCHAR(10),
    White_ID INT,
    Black_ID INT,
    Game_Result VARCHAR(10),
    ECO CHAR(3),
    Opening VARCHAR(20),
    PGN VARCHAR(10000)
    )
    PRIMARY INDEX( Event_ID );
    
