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
create index AppId on "App" ("AppId")
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
create index DataChange_LastTime on "App" ("DataChange_LastTime")
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
create index IX_Name on "App" ("Name")
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
alter table "App"
  add constraint PRIMARY00000 primary key ("Id")
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
  

-- Create table
create table "Audit"
(
  "Id"                        NUMBER not null,
  "EntityName"                VARCHAR2(50) default 'default' not null,
  "EntityId"                  NUMBER,
  "OpName"                    VARCHAR2(50) default 'default' not null,
  "Comment"                   VARCHAR2(500),
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
create index DataChange_LastTime00001 on "Audit" ("DataChange_LastTime")
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
alter table "Audit"
  add constraint PRIMARY00002 primary key ("Id")
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
  


-- Create table
create table "Cluster"
(
  "Id"                        NUMBER not null,
  "Name"                      VARCHAR2(32) not null,
  "AppId"                     VARCHAR2(32) not null,
  "ParentClusterId"           NUMBER default 0 not null,
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
create index DataChange_LastTime00002 on "Cluster" ("DataChange_LastTime")
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
create index IX_AppId_Name on "Cluster" ("AppId", "Name")
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
create index IX_ParentClusterId on "Cluster" ("ParentClusterId")
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
alter table "Cluster"
  add constraint PRIMARY00003 primary key ("Id")
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



-- Create table
create table "Commit"
(
  "Id"                        NUMBER not null,
  "ChangeSets"                CLOB,
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "ClusterName"               VARCHAR2(500) default 'default' not null,
  "NamespaceName"             VARCHAR2(500) default 'default' not null,
  "Comment"                   VARCHAR2(500),
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
create index AppId00000 on "Commit" ("AppId")
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
create index ClusterName on "Commit" ("ClusterName")
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
create index DataChange_LastTime00003 on "Commit" ("DataChange_LastTime")
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
create index NamespaceName on "Commit" ("NamespaceName")
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
alter table "Commit"
  add constraint PRIMARY00004 primary key ("Id")
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


-- Create table
create table "GrayReleaseRule"
(
  "Id"                        NUMBER not null,
  "AppId"                     VARCHAR2(32) default 'default' not null,
  "ClusterName"               VARCHAR2(32) default 'default' not null,
  "NamespaceName"             VARCHAR2(32) default 'default' not null,
  "BranchName"                VARCHAR2(32) default 'default' not null,
  "Rules"                     VARCHAR2(1600),
  "ReleaseId"                 NUMBER default 0 not null,
  "BranchStatus"              NUMBER(3) default 1,
  "IsDeleted"                 NUMBER(3) default 1 not null,
  "DataChange_CreatedBy"      VARCHAR2(32) default 'default' not null,
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
create index DataChange_LastTime00004 on "GrayReleaseRule" ("DataChange_LastTime")
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
create index IX_Namespace on "GrayReleaseRule" ("AppId", "ClusterName", "NamespaceName")
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
alter table "GrayReleaseRule"
  add constraint PRIMARY00005 primary key ("Id")
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
  
  
-- Create table
create table "Instance"
(
  "Id"                     NUMBER not null,
  "AppId"                  VARCHAR2(32) default 'default' not null,
  "ClusterName"            VARCHAR2(32) default 'default' not null,
  "DataCenter"             VARCHAR2(64) default 'default',
  "Ip"                     VARCHAR2(32) not null,
  "DataChange_CreatedTime" DATE not null,
  "DataChange_LastTime"    DATE not null
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
create index IX_DataChange_LastTime on "Instance" ("DataChange_LastTime")
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
create index IX_IP on "Instance" ("Ip")
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
create unique index IX_UNIQUE_KEY on "Instance" (CASE  WHEN ("AppId" IS NOT NULL AND "ClusterName" IS NOT NULL AND "Ip" IS NOT NULL AND "DataCenter" IS NOT NULL) THEN "AppId"||U', '||"ClusterName"||U', '||"Ip"||U', '||"DataCenter" END)
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
alter table "Instance"
  add constraint PRIMARY00006 primary key ("Id")
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



-- Create table
create table "InstanceConfig"
(
  "Id"                     NUMBER not null,
  "InstanceId"             NUMBER,
  "ConfigAppId"            VARCHAR2(32) default 'default' not null,
  "ConfigClusterName"      VARCHAR2(32) default 'default' not null,
  "ConfigNamespaceName"    VARCHAR2(32) default 'default' not null,
  "ReleaseKey"             VARCHAR2(64) not null,
  "ReleaseDeliveryTime"    DATE,
  "DataChange_CreatedTime" DATE not null,
  "DataChange_LastTime"    DATE not null
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
create index IX_DataChange_LastTime00000 on "InstanceConfig" ("DataChange_LastTime")
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
create index IX_ReleaseKey on "InstanceConfig" ("ReleaseKey")
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
create unique index IX_UNIQUE_KEY00000 on "InstanceConfig" (CASE  WHEN ("InstanceId" IS NOT NULL AND "ConfigAppId" IS NOT NULL AND "ConfigNamespaceName" IS NOT NULL) THEN SYS_OP_C2C(TO_CHAR("InstanceId")||',')||"ConfigAppId"||U', '||"ConfigNamespaceName" END)
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
create index IX_Valid_Namespace on "InstanceConfig" ("ConfigAppId", "ConfigClusterName", "ConfigNamespaceName", "DataChange_LastTime")
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
alter table "InstanceConfig"
  add constraint PRIMARY00007 primary key ("Id")
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


-- Create table
create table "Item"
(
  "Id"                        NUMBER not null,
  "NamespaceId"               NUMBER default 0 not null,
  "Key"                       VARCHAR2(128) default 'default' not null,
  "Value"                     CLOB,
  "Comment"                   VARCHAR2(1024),
  "LineNum"                   NUMBER default 0,
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
create index DataChange_LastTime00005 on "Item" ("DataChange_LastTime")
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
create index IX_GroupId on "Item" ("NamespaceId")
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
alter table "Item"
  add constraint PRIMARY00008 primary key ("Id")
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

  
insert into "Item" 
values (1, 1, 'timeout', '100', 'sample timeout配置', 1, 0, 'default', to_date('11-09-2017 15:41:27', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:27', 'dd-mm-yyyy hh24:mi:ss'));


-- Create table
create table "Namespace"
(
  "Id"                        NUMBER not null,
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "ClusterName"               VARCHAR2(500) default 'default' not null,
  "NamespaceName"             VARCHAR2(500) default 'default' not null,
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
create index AppId_ClusterName_NamespaceNa on "Namespace" ("AppId", "ClusterName", "NamespaceName")
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
create index DataChange_LastTime00006 on "Namespace" ("DataChange_LastTime")
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
create index IX_NamespaceName on "Namespace" ("NamespaceName")
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
alter table "Namespace"
  add constraint PRIMARY00009 primary key ("Id")
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


-- Create table
create table "NamespaceLock"
(
  "Id"                        NUMBER not null,
  "NamespaceId"               NUMBER default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE,
  "IsDeleted"                 NUMBER(3) default 1 not null
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
create index DataChange_LastTime00007 on "NamespaceLock" ("DataChange_LastTime")
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
create unique index IX_NamespaceId on "NamespaceLock" (CASE  WHEN "NamespaceId" IS NOT NULL THEN "NamespaceId" END)
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
alter table "NamespaceLock"
  add constraint PRIMARY00010 primary key ("Id")
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

  
-- Create table
create table "Release"
(
  "Id"                        NUMBER not null,
  "ReleaseKey"                VARCHAR2(64) not null,
  "Name"                      VARCHAR2(64) default 'default' not null,
  "Comment"                   VARCHAR2(256),
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "ClusterName"               VARCHAR2(500) default 'default' not null,
  "NamespaceName"             VARCHAR2(500) default 'default' not null,
  "Configurations"            CLOB,
  "IsAbandoned"               NUMBER(3) default 1 not null,
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
create index AppId_ClusterName_GroupName on "Release" ("AppId", "ClusterName", "NamespaceName")
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
create index DataChange_LastTime00008 on "Release" ("DataChange_LastTime")
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
create index IX_ReleaseKey00000 on "Release" ("ReleaseKey")
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
alter table "Release"
  add constraint PRIMARY00011 primary key ("Id")
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


-- Create table
create table "ReleaseMessage"
(
  "Id"                  NUMBER not null,
  "Message"             VARCHAR2(1024) not null,
  "DataChange_LastTime" DATE not null
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
create index DataChange_LastTime00009 on "ReleaseMessage" ("DataChange_LastTime")
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
create index IX_Message on "ReleaseMessage" ("Message")
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
alter table "ReleaseMessage"
  add constraint PRIMARY00013 primary key ("Id")
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


-- Create table
create table  "ReleaseHistory"
(
  "Id"                        NUMBER not null,
  "AppId"                     VARCHAR2(32) default 'default' not null,
  "ClusterName"               VARCHAR2(32) default 'default' not null,
  "NamespaceName"             VARCHAR2(32) default 'default' not null,
  "BranchName"                VARCHAR2(32) default 'default' not null,
  "ReleaseId"                 NUMBER default 0 not null,
  "PreviousReleaseId"         NUMBER default 0 not null,
  "Operation"                 NUMBER(5) default 0 not null,
  "OperationContext"          CLOB,
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
create index IX_DataChange_LastTime00001 on  "ReleaseHistory" ("DataChange_LastTime")
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
create index IX_Namespace00000 on  "ReleaseHistory" ("AppId", "ClusterName", "NamespaceName", "BranchName")
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
create index IX_ReleaseId on  "ReleaseHistory" ("ReleaseId")
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
alter table  "ReleaseHistory"
  add constraint PRIMARY00012 primary key ("Id")
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


-- Create table
create table "ServerConfig"
(
  "Id"                        NUMBER not null,
  "Key"                       VARCHAR2(64) default 'default' not null,
  "Cluster"                   VARCHAR2(32) default 'default' not null,
  "Value"                     VARCHAR2(500),
  "Comment"                   VARCHAR2(1024),
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
create index DataChange_LastTime00010 on "ServerConfig" ("DataChange_LastTime")
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
create index IX_Key on "ServerConfig" ("Key")
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
alter table "ServerConfig"
  add constraint PRIMARY00014 primary key ("Id")
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

insert into "ServerConfig" values (1, 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('12-09-2017 14:41:58', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" values (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" values (3, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" values (4, 'appnamespace.private.enable', 'default', 'false', '是否开启private namespace', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" values (5, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'));


-- Create sequence 
create sequence ID_SEQ
minvalue 1
maxvalue 9223372036854775807
start with 1
increment by 1
cache 20
cycle
order;