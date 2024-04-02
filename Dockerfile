FROM tomcat:9.0
COPY /target/maven-web-application.war /home/neelima/app1.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/home/neelima/app1.jar"
