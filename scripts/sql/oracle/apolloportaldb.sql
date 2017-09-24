-- Create table
create table "App"
(
  "Id"                        NUMBER not null,
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "Name"                      VARCHAR2(500) default 'default' not null,
  "OrgId"                     VARCHAR2(32) default 'default' not null,
  "OrgName"                   VARCHAR2(64) default 'default' not null,
  "OwnerName"                 VARCHAR2(500) default 'default' not null,
  "OwnerEmail"                VARCHAR2(500) default 'default' not null,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32) default 'default' not null,
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index AppId on "App" ("AppId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index DataChange_LastTime on "App" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_Name on "App" ("Name")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "App"
  add constraint PRIMARY00000 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

insert into "App"
values (1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', 0, 'default', to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into "App"
values (2, 'system111', 'FIT_AGENT-WEB', 'TEST2', '样例部门2', 'apollo', 'apollo@acme.com', 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:25:29', 'dd-mm-yyyy hh24:mi:ss'));

insert into "App"
values (3, '201709121725', 'FIT_ALU-WEB', 'TEST2', '样例部门2', 'apollo', 'apollo@acme.com', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));



-- Create table
create table "AppNamespace"
(
  "Id"                        NUMBER not null,
  "Name"                      VARCHAR2(32) not null,
  "AppId"                     VARCHAR2(32) not null,
  "Format"                    VARCHAR2(32) default 'properties' not null,
  "IsPublic"                  NUMBER(3) default 1 not null,
  "Comment"                   VARCHAR2(64),
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOCONFIGDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index DataChange_LastTime00000 on "AppNamespace" ("DataChange_LastTime")
  tablespace APOLLOCONFIGDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_AppId on "AppNamespace" ("AppId")
  tablespace APOLLOCONFIGDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index Name_AppId on "AppNamespace" ("Name", "AppId")
  tablespace APOLLOCONFIGDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "AppNamespace"
  add constraint PRIMARY00001 primary key ("Id")
  using index 
  tablespace APOLLOCONFIGDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

insert into "AppNamespace" 
values (1, 'application', 'SampleApp', 'properties', 0, 'default app namespace', 0, null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "AppNamespace" 
values (2, 'application', 'system111', 'properties', 0, 'default app namespace', 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "AppNamespace" 
values (3, 'application', '201709121725', 'properties', 0, 'default app namespace', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "AppNamespace" 
values (4, 'TEST2.CAB2B', '201709121725', 'properties', 1, null, 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));



-- Create table
create table "Consumer"
(
  "Id"                        NUMBER not null,
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "Name"                      VARCHAR2(500) default 'default' not null,
  "OrgId"                     VARCHAR2(32) default 'default' not null,
  "OrgName"                   VARCHAR2(64) default 'default' not null,
  "OwnerName"                 VARCHAR2(500) default 'default' not null,
  "OwnerEmail"                VARCHAR2(500) default 'default' not null,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32) default 'default' not null,
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index AppId00000 on "Consumer" ("AppId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index DataChange_LastTime00001 on "Consumer" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "Consumer"
  add constraint PRIMARY00002 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


-- Create table
create table "ConsumerAudit"
(
  "Id"                     NUMBER not null,
  "ConsumerId"             NUMBER,
  "Uri"                    VARCHAR2(1024) not null,
  "Method"                 VARCHAR2(16) not null,
  "DataChange_CreatedTime" DATE not null,
  "DataChange_LastTime"    DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IX_ConsumerId on "ConsumerAudit" ("ConsumerId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_DataChange_LastTime on "ConsumerAudit" ("DataChange_CreatedTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "ConsumerAudit"
  add constraint PRIMARY00003 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


-- Create table
create table "ConsumerRole"
(
  "Id"                        NUMBER not null,
  "ConsumerId"                NUMBER,
  "RoleId"                    NUMBER,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32) default 'default' not null,
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IX_ConsumerId_RoleId on "ConsumerRole" ("ConsumerId", "RoleId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_DataChange_LastTime00000 on "ConsumerRole" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_RoleId on "ConsumerRole" ("RoleId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "ConsumerRole"
  add constraint PRIMARY00004 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

  
-- Create table
create table "ConsumerToken"
(
  "Id"                        NUMBER not null,
  "ConsumerId"                NUMBER,
  "Token"                     VARCHAR2(128) not null,
  "Expires"                   TIMESTAMP(6) default to_date('2099-01-01', 'YYYY-MM-DD') not null,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32) default 'default' not null,
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index DataChange_LastTime00002 on "ConsumerToken" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index IX_Token on "ConsumerToken" (CASE  WHEN "Token" IS NOT NULL THEN "Token" END)
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "ConsumerToken"
  add constraint PRIMARY00005 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  

-- Create table
create table "Favorite"
(
  "Id"                        NUMBER not null,
  "UserId"                    VARCHAR2(32) default 'default' not null,
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "Position"                  NUMBER(10) default 10000 not null,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32) default 'default' not null,
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index AppId00001 on "Favorite" ("AppId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index DataChange_LastTime00003 on "Favorite" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_UserId on "Favorite" ("UserId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "Favorite"
  add constraint PRIMARY00006 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  
insert into "Favorite" 
values (1, 'apollo', 'system111', 10000, 0, 'apollo', to_date('12-09-2017 16:42:52', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 16:42:52', 'dd-mm-yyyy hh24:mi:ss'));



-- Create table
create table "Permission"
(
  "Id"                        NUMBER not null,
  "PermissionType"            VARCHAR2(32) not null,
  "TargetId"                  VARCHAR2(256) not null,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IX_DataChange_LastTime00001 on "Permission" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_TargetId_PermissionType on "Permission" ("TargetId", "PermissionType")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "Permission"
  add constraint PRIMARY00007 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

insert into "Permission" 
values (1, 'CreateCluster', 'SampleApp', 0, null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (2, 'CreateNamespace', 'SampleApp', 0, null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (3, 'AssignRole', 'SampleApp', 0, null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (4, 'ModifyNamespace', 'SampleApp+application', 0, null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (5, 'ReleaseNamespace', 'SampleApp+application', 0, null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (6, 'CreateCluster', 'system111', 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (7, 'CreateNamespace', 'system111', 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (8, 'AssignRole', 'system111', 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (9, 'ModifyNamespace', 'system111+application', 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (10, 'ReleaseNamespace', 'system111+application', 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (11, 'CreateCluster', '201709121725', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (12, 'CreateNamespace', '201709121725', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (13, 'AssignRole', '201709121725', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (14, 'ModifyNamespace', '201709121725+application', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (15, 'ReleaseNamespace', '201709121725+application', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (16, 'ModifyNamespace', '201709121725+TEST2.CAB2B', 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Permission" 
values (17, 'ReleaseNamespace', '201709121725+TEST2.CAB2B', 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));  


-- Create table
create table "Role"
(
  "Id"                        NUMBER not null,
  "RoleName"                  VARCHAR2(256) not null,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IX_DataChange_LastTime00002 on "Role" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_RoleName on "Role" ("RoleName")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "Role"
  add constraint PRIMARY00008 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


insert into "Role" 
values (1, 'Master+SampleApp', 0, 'default', to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (2, 'ModifyNamespace+SampleApp+application', 0, 'default', to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (3, 'ReleaseNamespace+SampleApp+application', 0, 'default', to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:48', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (4, 'Master+system111', 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (5, 'ModifyNamespace+system111+application', 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (6, 'ReleaseNamespace+system111+application', 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (7, 'Master+201709121725', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (8, 'ModifyNamespace+201709121725+application', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (9, 'ReleaseNamespace+201709121725+application', 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (10, 'ModifyNamespace+201709121725+TEST2.CAB2B', 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into "Role" 
values (11, 'ReleaseNamespace+201709121725+TEST2.CAB2B', 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));


-- Create table
create table "RolePermission"
(
  "Id"                        NUMBER not null,
  "RoleId"                    NUMBER,
  "PermissionId"              NUMBER,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IX_DataChange_LastTime00003 on "RolePermission" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_PermissionId on "RolePermission" ("PermissionId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_RoleId00000 on "RolePermission" ("RoleId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "RolePermission"
  add constraint PRIMARY00009 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

insert into "RolePermission" 
values (1, 1, 1, 0, null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (2, 1, 2, 0, null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (3, 1, 3, 0, null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (4, 2, 4, 0, null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (5, 3, 5, 0, null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:49', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (6, 4, 6, 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (7, 4, 7, 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (8, 4, 8, 0, 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (9, 5, 9, 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (10, 6, 10, 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (11, 7, 11, 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (12, 7, 12, 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (13, 7, 13, 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (14, 8, 14, 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (15, 9, 15, 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (16, 10, 16, 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into "RolePermission" 
values (17, 11, 17, 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));


-- Create table
create table "UserRole"
(
  "Id"                        NUMBER not null,
  "UserId"                    VARCHAR2(128),
  "RoleId"                    NUMBER,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IX_DataChange_LastTime00004 on "UserRole" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_RoleId00001 on "UserRole" ("RoleId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_UserId_RoleId on "UserRole" ("UserId", "RoleId")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "UserRole"
  add constraint PRIMARY00011 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


insert into "UserRole" 
values (1, 'apollo', 1, 0, null, to_date('11-09-2017 15:36:50', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:50', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (2, 'apollo', 2, 0, null, to_date('11-09-2017 15:36:50', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:50', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (3, 'apollo', 3, 0, null, to_date('11-09-2017 15:36:50', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:50', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (4, 'apollo', 4, 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (5, 'apollo', 5, 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (6, 'apollo', 6, 0, 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 12:06:27', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (7, 'apollo', 7, 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (8, 'apollo', 8, 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (9, 'apollo', 9, 0, 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (10, 'apollo', 10, 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));

insert into "UserRole" 
values (11, 'apollo', 11, 0, 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'), 'apollo', to_date('12-09-2017 17:27:12', 'dd-mm-yyyy hh24:mi:ss'));



-- Create table
create table "ServerConfig"
(
  "Id"                        NUMBER not null,
  "Key"                       VARCHAR2(64) default 'default' not null,
  "Value"                     VARCHAR2(2048),
  "Comment"                   VARCHAR2(1024),
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32) default 'default' not null,
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
)
tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index DataChange_LastTime00004 on "ServerConfig" ("DataChange_LastTime")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IX_Key on "ServerConfig" ("Key")
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table "ServerConfig"
  add constraint PRIMARY00010 primary key ("Id")
  using index 
  tablespace APOLLOPORTALDB_DAT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

  
insert into "ServerConfig" 
values (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', 0, 'default', to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('15-09-2017 10:38:00', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" 
values (2, 'organizations', '[{"orgId":"TEST1","orgName":"样例部门1"},{"orgId":"TEST2","orgName":"样例部门2"}]', '部门列表', 0, 'default', to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" 
values (3, 'superAdmin', 'apollo', 'Portal超级管理员', 0, 'default', to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" 
values (4, 'api.readTimeout', '10000', 'http接口read timeout', 0, 'default', to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" 
values (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', 0, 'default', to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:36:47', 'dd-mm-yyyy hh24:mi:ss'));
