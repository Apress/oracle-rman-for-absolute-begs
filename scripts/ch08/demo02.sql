-- Simple package that is used to obfuscate the data:

create or replace package obfus is
  function obf(clear_string varchar2) return varchar2;
  function unobf(obs_string varchar2) return varchar2;
end obfus;
/
--
create or replace package body obfus is
  fromstr varchar2(62) := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ' ||
             'abcdefghijklmnopqrstuvwxyz';
  tostr varchar2(62)   := 'defghijklmnopqrstuvwxyzabc3456789012' ||
             'KLMNOPQRSTUVWXYZABCDEFGHIJ';
--
function obf(clear_string varchar2) return varchar2 is
begin
  return translate(clear_string, fromstr, tostr);
end obf;
--
function unobf(obs_string varchar2) return varchar2 is
begin
  return translate(obs_string, tostr, fromstr);
end unobf;
end obfus;
/
