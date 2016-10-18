-- Determine Where to Copy the Backup Files and How Much Space Is Required

select sum(sum_bytes)/1024/1024 m_bytes
from(
select sum(bytes) sum_bytes from v$datafile
union
select sum(bytes) sum_bytes from v$tempfile
union
select (sum(bytes) * members) sum_bytes from v$log
group by members);

-- Identify the Locations and Names of the Database Files to Copy

select name from v$datafile
union
select name from v$controlfile
union
select name from v$tempfile
union
select member from v$logfile;


