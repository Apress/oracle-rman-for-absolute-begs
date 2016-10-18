-- Log status

SELECT group#, status, archived,
thread#, sequence#, first_change#
FROM v$log;

