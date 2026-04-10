FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/myapp-1.0-SNAPSHOT-jar-with-dependencies.jar myapp.jar
ENTRYPOINT ["java", "-jar", "myapp.jar"]
