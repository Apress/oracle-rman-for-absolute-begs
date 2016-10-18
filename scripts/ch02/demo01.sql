-- Managing Control Files
select distinct type from v$controlfile_record_section;
select name, open_mode, created, current_scn from v$database;
