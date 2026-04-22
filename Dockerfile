# Stage 1: Build
FROM gradle:8-jdk17 AS builder
WORKDIR /app
COPY . .
RUN gradle build

# Stage 2: Run
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
