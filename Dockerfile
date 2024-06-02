# Use a base image with Java 17
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven build artifact (jar file) to the working directory
COPY target/config-server-0.0.1-SNAPSHOT.jar /app/config-server.jar

# Expose the port the application runs on
EXPOSE 8888

# Copy the application's jar to the container
ARG JAR_FILE=target/config-server-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} api-gateway.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "api-gateway.jar"]
