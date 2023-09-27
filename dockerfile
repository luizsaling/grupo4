FROM maven:latest as build-stage

WORKDIR /app

COPY . /app

RUN mvn clean package

FROM tomcat:9

COPY --from=build-stage /app/target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

