FROM maven:3.8.5-openjdk-17-slim AS build-stage
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests


FROM eclipse-temurin:17-jre-alpine-3.23 AS production-stage
WORKDIR /app
ENV TZ=America/Sao_Paulo
COPY --from=build-stage /app/target/zipcode_application_backend--0.0.1-SNAPSHOT.jar app.jar
EXPOSE 9091
ENTRYPOINT ["java", "-jar", "app.jar"]