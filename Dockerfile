# Pull base image 
From tomcat:9-jre9 

# Maintainer 
MAINTAINER "avismcgill19@yahoo.com" 
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps
