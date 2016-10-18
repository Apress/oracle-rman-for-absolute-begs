-- Identify Which Files Need to Be Backed Up
select name from v$datafile;

select tablespace_name, file_name
from dba_data_files
order by 1,2;

-- Note the Maximum Sequence Number of the Online Redo Logs

select thread#, max(sequence#)
from v$log
group by thread#
order by thread#;


