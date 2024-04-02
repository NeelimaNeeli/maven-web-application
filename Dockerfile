FROM tomcat:latest
COPY /target/maven-web-application.war /home/neelima/app1.jar
EXPOSE 8080

