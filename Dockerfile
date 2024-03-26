FROM maven:3.6.3-jdk-11 as BUILD

WORKDIR /app

COPY . /app

RUN mvn clean package

FROM tomcat:9.0

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=BUILD /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
