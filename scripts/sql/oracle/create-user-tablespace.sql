
--For linux-----------------------------------------------------------------

create tablespace APOLLOCONFIGDB_DAT
DATAfile '/home/oracle/data/APOLLOCONFIGDB_DAT.DBF'
size 100M
autoextend on
next 10M
maxsize 4G
extent management local
segment space management auto online;

create tablespace APOLLOPORTALDB_DAT
DATAfile '/home/oracle/data/APOLLOPORTALDB_DAT.DBF'
size 100M
autoextend on
next 10M
maxsize 4G
extent management local
segment space management auto online;

create user apolloconfig identified by 123456 
default tablespace APOLLOCONFIGDB_DAT temporary tablespace TEMP profile DEFAULT;

create user apolloportal identified by 123456 
default tablespace APOLLOCONFIGDB_DAT temporary tablespace TEMP profile DEFAULT;

grant connect,resource to apolloconfig;
grant connect,resource to apolloportal;





--For windows----------------------------------------------------------------

create tablespace APOLLOCONFIGDB_DAT
DATAfile 'D:\T_ProgramFiles-EX\oracle-base\oradata\orcl\APOLLOCONFIGDB_DAT.DBF'
size 100M
autoextend on
next 10M
maxsize 4G
extent management local
segment space management auto online;

create tablespace APOLLOPORTALDB_DAT
DATAfile 'D:\T_ProgramFiles-EX\oracle-base\oradata\orcl\APOLLOPORTALDB_DAT.DBF'
size 100M
autoextend on
next 10M
maxsize 4G
extent management local
segment space management auto online;

create user apolloconfig identified by 123456 
default tablespace APOLLOCONFIGDB_DAT temporary tablespace TEMP profile DEFAULT;

create user apolloportal identified by 123456 
default tablespace APOLLOCONFIGDB_DAT temporary tablespace TEMP profile DEFAULT;

grant connect,resource to apolloconfig;
grant connect,resource to apolloportal;
