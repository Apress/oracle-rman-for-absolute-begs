-- View the starting log sequence number 

select
 HXFNM file_name
,HXFIL file_num
,FHTNM tablespace_name
,FHTHR thread
,FHRBA_SEQ sequence
from X$KCVFH
where FHTNM = 'USERS';

