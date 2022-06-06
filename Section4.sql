select current_date;
 
select 1 + null * 10;
 
select *
from dbc.tables
where lower(tablename) like '%day%';

INSERT INTO tablename1 SELECT
        col1,col2 FROM tablename2 WHERE col1 > 10;
        
CREATE DATABASE dbname FROM parentdb AS 
        PERM = permsize
        SPOOL= spoolsize
        FALLBACK ACCOUNT= 'accountname' 
        NO AFTER JOURNAL 
        DUAL BEFORE JOURNAL
        DEFAULT JOURNAL TABLE = tablename;
	
       
	
	


