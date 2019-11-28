FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/trekawek/jhttp

FROM maven:3.6.2-ibmjava-8-alpine as build
WORKDIR /app
COPY --from=clone app/jhttp /app
RUN mvn install
RUN mvn clean package

FROM openjdk:8-alpine
WORKDIR /app
COPY --from=build /app/target /app
ENTRYPOINT ["java", "-jar", "jhttp-1.0-SNAPSHOT.jar"]
