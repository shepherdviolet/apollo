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
-- Add comments to the table 
comment on table "App"
  is '应用表';
-- Add comments to the columns 
comment on column "App"."Id"
  is '主键';
comment on column "App"."AppId"
  is 'AppID';
comment on column "App"."Name"
  is '应用名';
comment on column "App"."OrgId"
  is '部门Id';
comment on column "App"."OrgName"
  is '部门名字';
comment on column "App"."OwnerName"
  is 'ownerName';
comment on column "App"."OwnerEmail"
  is 'ownerEmail';
comment on column "App"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "App"."DataChange_CreatedTime"
  is '创建时间';
comment on column "App"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "App"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "AppNamespace"
  is '应用namespace定义';
-- Add comments to the columns 
comment on column "AppNamespace"."Id"
  is '主键';
comment on column "AppNamespace"."Name"
  is 'namespace名字，注意，需要全局唯一';
comment on column "AppNamespace"."AppId"
  is 'app id';
comment on column "AppNamespace"."Format"
  is 'namespace的format类型';
comment on column "AppNamespace"."Comment"
  is '注释';
comment on column "AppNamespace"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "AppNamespace"."DataChange_CreatedTime"
  is '创建时间';
comment on column "AppNamespace"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "AppNamespace"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "Consumer"
  is '开放API消费者';
-- Add comments to the columns 
comment on column "Consumer"."Id"
  is '主键';
comment on column "Consumer"."AppId"
  is 'AppID';
comment on column "Consumer"."Name"
  is '应用名';
comment on column "Consumer"."OrgId"
  is '部门Id';
comment on column "Consumer"."OrgName"
  is '部门名字';
comment on column "Consumer"."OwnerName"
  is 'ownerName';
comment on column "Consumer"."OwnerEmail"
  is 'ownerEmail';
comment on column "Consumer"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Consumer"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Consumer"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Consumer"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "ConsumerAudit"
  is 'consumer审计表';
-- Add comments to the columns 
comment on column "ConsumerAudit"."Id"
  is '主键';
comment on column "ConsumerAudit"."ConsumerId"
  is 'Consumer Id';
comment on column "ConsumerAudit"."Uri"
  is '访问的Uri';
comment on column "ConsumerAudit"."Method"
  is '访问的Method';
comment on column "ConsumerAudit"."DataChange_CreatedTime"
  is '创建时间';
comment on column "ConsumerAudit"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "ConsumerRole"
  is 'consumer和role的绑定表';
-- Add comments to the columns 
comment on column "ConsumerRole"."Id"
  is '主键';
comment on column "ConsumerRole"."ConsumerId"
  is 'Consumer Id';
comment on column "ConsumerRole"."RoleId"
  is 'Role Id';
comment on column "ConsumerRole"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "ConsumerRole"."DataChange_CreatedTime"
  is '创建时间';
comment on column "ConsumerRole"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "ConsumerRole"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "ConsumerToken"
  is 'consumer token表';
-- Add comments to the columns 
comment on column "ConsumerToken"."Id"
  is '主键';
comment on column "ConsumerToken"."ConsumerId"
  is 'Consumer Id';
comment on column "ConsumerToken"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "ConsumerToken"."DataChange_CreatedTime"
  is '创建时间';
comment on column "ConsumerToken"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "ConsumerToken"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "Favorite"
  is '应用收藏表';
-- Add comments to the columns 
comment on column "Favorite"."Id"
  is '主键';
comment on column "Favorite"."UserId"
  is '收藏的用户';
comment on column "Favorite"."AppId"
  is 'AppID';
comment on column "Favorite"."Position"
  is '收藏顺序';
comment on column "Favorite"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Favorite"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Favorite"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Favorite"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "Permission"
  is 'permission表';
-- Add comments to the columns 
comment on column "Permission"."Id"
  is '主键';
comment on column "Permission"."PermissionType"
  is '权限类型';
comment on column "Permission"."TargetId"
  is '权限对象类型';
comment on column "Permission"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Permission"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Permission"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Permission"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "Role"
  is '角色表';
-- Add comments to the columns 
comment on column "Role"."Id"
  is '主键';
comment on column "Role"."RoleName"
  is 'Role name';
comment on column "Role"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Role"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Role"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Role"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "RolePermission"
  is '角色和权限的绑定表';
-- Add comments to the columns 
comment on column "RolePermission"."Id"
  is '主键';
comment on column "RolePermission"."RoleId"
  is 'Role Id';
comment on column "RolePermission"."PermissionId"
  is 'Permission Id';
comment on column "RolePermission"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "RolePermission"."DataChange_CreatedTime"
  is '创建时间';
comment on column "RolePermission"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "RolePermission"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "UserRole"
  is '用户和role的绑定表';
-- Add comments to the columns 
comment on column "UserRole"."Id"
  is '主键';
comment on column "UserRole"."UserId"
  is '用户身份标识';
comment on column "UserRole"."RoleId"
  is 'Role Id';
comment on column "UserRole"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "UserRole"."DataChange_CreatedTime"
  is '创建时间';
comment on column "UserRole"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "UserRole"."DataChange_LastTime"
  is '最后修改时间';
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
-- Add comments to the table 
comment on table "ServerConfig"
  is '配置服务自身配置';
-- Add comments to the columns 
comment on column "ServerConfig"."Id"
  is '主键';
comment on column "ServerConfig"."Key"
  is '配置项Key';
comment on column "ServerConfig"."Value"
  is '配置项值';
comment on column "ServerConfig"."Comment"
  is '注释';
comment on column "ServerConfig"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "ServerConfig"."DataChange_CreatedTime"
  is '创建时间';
comment on column "ServerConfig"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "ServerConfig"."DataChange_LastTime"
  is '最后修改时间';
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


-- Create sequence 
create sequence ID_SEQ
minvalue 1
maxvalue 9223372036854775807
start with 100
increment by 1
cache 20
cycle
order;

-- Sample Data

INSERT INTO "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "DataChange_CreatedTime")
VALUES
	(6, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', sysdate);

INSERT INTO "AppNamespace" ("Id", "Name", "AppId", "Format", "IsPublic", "Comment", "DataChange_CreatedTime")
VALUES
	(7, 'application', 'SampleApp', 'properties', 0, 'default app namespace', sysdate);

INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedTime")
VALUES
	(8, 'CreateCluster', 'SampleApp', sysdate);
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedTime")
VALUES
	(9, 'CreateNamespace', 'SampleApp', sysdate);
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedTime")
VALUES
	(10, 'AssignRole', 'SampleApp', sysdate);
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedTime")
VALUES
	(11, 'ModifyNamespace', 'SampleApp+application', sysdate);
INSERT INTO "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedTime")
VALUES
	(12, 'ReleaseNamespace', 'SampleApp+application', sysdate);

INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedTime")
VALUES
	(13, 'Master+SampleApp', sysdate);
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedTime")
VALUES
	(14, 'ModifyNamespace+SampleApp+application', sysdate);
INSERT INTO "Role" ("Id", "RoleName", "DataChange_CreatedTime")
VALUES
	(15, 'ReleaseNamespace+SampleApp+application', sysdate);

INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedTime")
VALUES
	(16, 13, 8, sysdate);
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedTime")
VALUES
	(17, 13, 9, sysdate);
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedTime")
VALUES
	(18, 13, 10, sysdate);
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedTime")
VALUES
	(19, 14, 11, sysdate);
INSERT INTO "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedTime")
VALUES
	(20, 15, 12, sysdate);

INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedTime")
VALUES
	(21, 'apollo', 1, sysdate);
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedTime")
VALUES
	(22, 'apollo', 2, sysdate);
INSERT INTO "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedTime")
VALUES
	(23, 'apollo', 3, sysdate);
