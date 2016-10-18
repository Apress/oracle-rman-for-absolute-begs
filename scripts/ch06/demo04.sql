-- You can view the oldest SCN and time you can flash back
-- your database to by running the following SQL:

select
 oldest_flashback_scn
,to_char(oldest_flashback_time,'dd-mon-yy hh24:mi:ss')
from v$flashback_database_log;

