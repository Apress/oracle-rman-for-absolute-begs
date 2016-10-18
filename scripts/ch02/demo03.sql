-- Displaying Online Redo Log Information

COL group#     FORM 99999
COL thread#    FORM 99999
COL grp_status FORM a10
COL member     FORM a30
COL mem_status FORM a10
COL mbytes     FORM 999999
--
SELECT
 a.group#
,a.thread#
,a.status grp_status
,b.member member
,b.status mem_status
,a.bytes/1024/1024 mbytes
FROM v$log     a,
     v$logfile b
WHERE a.group# = b.group#
ORDER BY a.group#, b.member;
