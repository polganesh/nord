FROM openjdk:8
ADD target/spring-0.0.1-SNAPSHOT.jar spring-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Done-jar.silent=true","-Xms768m", "-Xmx768m", "-jar", "spring-0.0.1-SNAPSHOT.jar"]