-- Compares the SCN in the control file (for each data file) with the SCN in the data file header:

SET LINES 132
COL name             FORM a40
COL status           FORM A8
COL file#            FORM 9999
COL control_file_SCN FORM 999999999999999
COL datafile_SCN     FORM 999999999999999
--
SELECT
 a.name
,a.status
,a.file#
,a.checkpoint_change# control_file_SCN
,b.checkpoint_change# datafile_SCN
,CASE
   WHEN ((a.checkpoint_change# - b.checkpoint_change#) = 0) THEN 'Startup Normal'
   WHEN ((b.checkpoint_change#) = 0)                        THEN 'File Missing?'
   WHEN ((a.checkpoint_change# - b.checkpoint_change#) > 0) THEN 'Media Rec. Req.'
   WHEN ((a.checkpoint_change# - b.checkpoint_change#) < 0) THEN 'Old Control File'
   ELSE 'what the ?'
 END datafile_status 
FROM v$datafile        a -- control file SCN for datafile
    ,v$datafile_header b -- datafile header SCN
WHERE a.file# = b.file#
ORDER BY a.file#;
