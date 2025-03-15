FROM tomcat:9-jdk11
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8085
CMD ["catalina.sh", "run"]