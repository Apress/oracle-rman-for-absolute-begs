-- Determine whether a Data Pump job is running

select job_name, operation, job_mode, state
from dba_datapump_jobs;

-- You can also query the DBA_DATAPUMP_SESSIONS view for session information via the following query:

select sid, serial#, username, process, program
from v$session s,
     dba_datapump_sessions d
where s.saddr = d.saddr;

