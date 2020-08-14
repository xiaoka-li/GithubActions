FROM java:8
MAINTAINER xiaoka
VOLUME /mydate/GithubActions
ADD GithubActions-1.0-SNAPSHOT.jar app.jar
RUN bash -c 'touch /app.jar'
EXPOSE 18001
ENTRYPOINT ["java","-jar","/app.jar"]