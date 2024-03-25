FROM ubuntu:latest

RUN apt-get update
RUN apt-get install openjdk-21-jdk -y
COPY . /app

RUN apt-get install maven -y
RUN cd app && mvn clean install

EXPOSE 8080

RUN cp -r /app/target/app_docker_teste-0.0.1-SNAPSHOT.jar /app/app.jar

ENTRYPOINT [ "java", "-jar", "/app/app.jar"]