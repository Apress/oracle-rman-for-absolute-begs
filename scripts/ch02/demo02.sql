-- Displaying the contents of a control file
oradebug setmypid
oradebug unlimit
alter session set events 'immediate trace name controlf level 9';
select value from v$diag_info where name='Diag Trace';
