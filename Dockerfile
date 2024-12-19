# Step 1: Build the application using Maven
FROM maven:3.8.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package && ls -al /app/target

# Step 2: Prepare Tomcat to deploy the application
FROM tomcat:latest
COPY --from=build /app/target/webapp.war /usr/local/tomcat/webapps/webapp.war

