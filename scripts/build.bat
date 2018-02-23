@echo off

rem apollo config db info
set apollo_config_db_url="jdbc:oracle:thin:@127.0.0.1:1521:ApolloConfigDB"
set apollo_config_db_username="ApolloConfigDB"
set apollo_config_db_password="1234"
set apollo_config_db_schema="ApolloConfigDB"

rem apollo portal db info
set apollo_portal_db_url="jdbc:oracle:thin:@127.0.0.1:1521:ApolloPortalDB"
set apollo_portal_db_username="ApolloPortalDB"
set apollo_portal_db_password="1234"

rem meta server url, different environments should have different meta server addresses
set dev_meta="http://localhost:8080"
set fat_meta="http://localhost:8080"
set uat_meta="http://localhost:8080"
set pro_meta="http://localhost:8080"

set META_SERVERS_OPTS=-Ddev_meta=%dev_meta% -Dfat_meta=%fat_meta% -Duat_meta=%uat_meta% -Dpro_meta=%pro_meta%

rem =============== Please do not modify the following content =============== 
rem go to script directory
cd "%~dp0"

cd ..

rem package config-service and admin-service
echo "==== starting to build config-service and admin-service ===="

call mvn clean package -DskipTests -pl apollo-configservice,apollo-adminservice -am -Dapollo_profile=github -Dspring_datasource_url=%apollo_config_db_url% -Dspring_datasource_username=%apollo_config_db_username% -Dspring_datasource_password=%apollo_config_db_password% -Dspring_jpa_hibernate_default_schema=%apollo_config_db_schema%

echo "==== building config-service and admin-service finished ===="

echo "==== starting to build portal ===="

call mvn clean package -DskipTests -pl apollo-portal -am -Dapollo_profile=github,auth -Dspring_datasource_url=%apollo_portal_db_url% -Dspring_datasource_username=%apollo_portal_db_username% -Dspring_datasource_password=%apollo_portal_db_password% %META_SERVERS_OPTS%

echo "==== building portal finished ===="

echo "==== starting to build client ===="

call mvn clean install -DskipTests -pl apollo-client -am %META_SERVERS_OPTS%

echo "==== building client finished ===="

pause
