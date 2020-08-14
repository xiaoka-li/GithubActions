FROM java:8
MAINTAINER xiaoka
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 18001
ENTRYPOINT ["java","-jar","/app.jar"]