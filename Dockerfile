FROM tomcat:9.0.95-jdk11
COPY target/pet-1.0.0-BUILD-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
COPY ./wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
EXPOSE 8090
CMD ["/wait-for-it.sh", "oracle_db:1541", "--", "catalina.sh", "run"]