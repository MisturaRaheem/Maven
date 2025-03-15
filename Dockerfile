FROM tomcat:9-jdk11

RUN mkdir -p /usr/local/tomcat/webapps/ROOT

COPY target/mavenwebapp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8085
CMD ["catalina.sh", "run"]
