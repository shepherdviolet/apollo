#!/bin/sh

# apollo config db info
apollo_config_db_url=jdbc:oracle:thin:@127.0.0.1:1521:ApolloConfigDB
apollo_config_db_username=ApolloConfigDB
apollo_config_db_password=1234
apollo_config_db_schema=ApolloConfigDB

# apollo portal db info
apollo_portal_db_url=jdbc:oracle:thin:@127.0.0.1:1521:ApolloPortalDB
apollo_portal_db_username=ApolloPortalDB
apollo_portal_db_password=1234

# meta server url
dev_meta=http://localhost:8080
#fat_meta=http://localhost:8080
#uat_meta=http://localhost:8080
#pro_meta=http://localhost:8080

META_SERVERS_OPTS="-Ddev_meta=$dev_meta -Dfat_meta=$fat_meta -Duat_meta=$uat_meta -Dpro_meta=$pro_meta"

# =============== Please do not modify the following content =============== #
# go to script directory
cd "${0%/*}"

cd ..

# package config-service and admin-service
echo "==== starting to build config-service and admin-service ===="

mvn clean package -DskipTests -pl apollo-configservice,apollo-adminservice -am -Dapollo_profile=github -Dspring_datasource_url=$apollo_config_db_url -Dspring_datasource_username=$apollo_config_db_username -Dspring_datasource_password=$apollo_config_db_password -Dspring_jpa_hibernate_default_schema=$apollo_config_db_schema

echo "==== building config-service and admin-service finished ===="

echo "==== starting to build portal ===="

mvn clean package -DskipTests -pl apollo-portal -am -Dapollo_profile=github,auth -Dspring_datasource_url=$apollo_portal_db_url -Dspring_datasource_username=$apollo_portal_db_username -Dspring_datasource_password=$apollo_portal_db_password $META_SERVERS_OPTS

echo "==== building portal finished ===="

echo "==== starting to build client ===="

mvn clean install -DskipTests -pl apollo-client -am $META_SERVERS_OPTS

echo "==== building client finished ===="

