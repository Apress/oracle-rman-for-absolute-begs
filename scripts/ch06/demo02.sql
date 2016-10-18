-- YES or null value in the RECOVER column indicates that there is a problem:

select file#, status, error, recover from v$datafile_header;

