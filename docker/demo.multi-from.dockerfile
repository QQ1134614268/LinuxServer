#First statge : define basic image for build
FROM maven:3.6.0-jdk-8-alpine AS build
#add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/
#build code and generate jar package
RUN mvn clean package

#Second stage: define mini image of java
FROM openjdk:8-jre-alpine
#copy jar from the first stage
COPY --from=build target/my-app-1.0-SNAPSHOT.jar my-app-1.0-SNAPSHOT.jar
#expose service port
EXPOSE 8080
#start service
CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
