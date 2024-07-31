#Base Image
FROM ubuntu:latest
#Install Necessary Packages
RUN apt-get -y update && apt-get -y install openjdk-17-jdk wget
#Download and Extract Tomcat:
# Download and Extract Tomcat:
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.30/bin/apache-tomcat-10.1.30.tar.gz -O /tmp/tomcat.tar.gz && \
    cd /tmp && tar xvfz tomcat.tar.gz && \
    mv /tmp/apache-tomcat-10.1.30 /opt/tomcat
#Copy WAR Files	
COPY *.war /opt/tomcat/webapps/
#Expose Port:
EXPOSE 8080
#Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
