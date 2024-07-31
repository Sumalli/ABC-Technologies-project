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


//# Use a base image with a Java runtime
//FROM openjdk:17-jdk

//# Set environment variables
//ENV TOMCAT_VERSION=10.1.30
//ENV TOMCAT_TAR=apache-tomcat-${TOMCAT_VERSION}.tar.gz
//ENV TOMCAT_URL=https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/${TOMCAT_TAR}
//ENV TOMCAT_HOME=/opt/tomcat

//# Install wget and other utilities
//RUN apt-get update && \
 //   apt-get install -y wget tar

//# Download and extract Tomcat
//RUN wget ${TOMCAT_URL} -O /tmp/tomcat.tar.gz && \
  //  mkdir -p ${TOMCAT_HOME} && \
  //  tar xvfz /tmp/tomcat.tar.gz -C ${TOMCAT_HOME} --strip-components=1 && \
  //  rm /tmp/tomcat.tar.gz

//# Add WAR file to Tomcat webapps
//COPY */.war ${TOMCAT_HOME}/webapps/

//# Expose Tomcat port
//EXPOSE 8080

//# Set Tomcat environment variables
//ENV CATALINA_HOME=${TOMCAT_HOME}

//# Start Tomcat
//CMD ["${CATALINA_HOME}/bin/catalina.sh", "run"]



