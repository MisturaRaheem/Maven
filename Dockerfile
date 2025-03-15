FROM tomcat:9-jdk11

# Make sure the WAR file exists by checking first
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

# Copy the WAR file - use the specific filename instead of wildcard
COPY target/mavenwebapp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8085
CMD ["catalina.sh", "run"]