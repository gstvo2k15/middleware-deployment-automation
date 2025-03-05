FROM tomcat:9.0-jdk11-temurin

# Create non-privilege user
RUN groupadd -r tomcat && useradd -r -g tomcat -d /usr/local/tomcat tomcat

# Copy secure TLS and Server hardning confs
COPY config/server.xml /usr/local/tomcat/conf/server.xml
COPY config/web.xml /usr/local/tomcat/conf/web.xml
COPY config/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY config/keystore.jks /usr/local/tomcat/conf/keystore.jks

RUN chown -R tomcat:tomcat /usr/local/tomcat \
    && chmod -R 750 /usr/local/tomcat/conf \
    && chmod 640 /usr/local/tomcat/conf/keystore.jks

# Define non-privilege user
USER tomcat

# Expose ports
EXPOSE 8080 8443

# Define start run command
CMD ["catalina.sh", "run"]
