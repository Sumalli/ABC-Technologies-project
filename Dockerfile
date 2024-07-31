FROM ubuntu:latest

# Install necessary packages
RUN apt-get -y update && \apt-get -y install openjdk-17-jdk wget
 
# Download and extract Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.25/bin/apache-tomcat-10.1.25.tar.gz -O /tmp/tomcat.tar.gz && \
    cd /tmp && tar xvfz tomcat.tar.gz && \
    mv /tmp/apache-tomcat-10.1.25 /opt/tomcat

# Copy the WAR file to the Tomcat webapp directory
COPY */.war /opt/tomcat/webapps/

# Expose the port Tomcat runs on
EXPOSE 8080

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]




