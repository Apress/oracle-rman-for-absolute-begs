-- Apply Redo Contained in the Online Redo Logs

select a.sequence#, a.status, a.first_change#, b.member
from v$log a, v$logfile b
where a.group# = b.group#
order by a.sequence#;

