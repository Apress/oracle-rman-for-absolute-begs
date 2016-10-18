-- The following query reports on the time taken for an RMAN backup per session. 
COL hours              FORM 9999.99
COL time_taken_display FORM a20
SET LINESIZE 132
-- 
SELECT
 session_recid
,compression_ratio
,time_taken_display
,(end_time - start_time) * 24 as hours
,TO_CHAR(end_time,'dd-mon-yy hh24:mi') as end_time
FROM v$rman_backup_job_details
ORDER BY end_time;

