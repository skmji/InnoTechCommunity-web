# Use an official Tomcat image as the base
FROM tomcat:9.0

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file into the Tomcat webapps directory
COPY dist/InnotechCommunity.war /usr/local/tomcat/webapps/ROOT.war


# Expose port 8080
EXPOSE 8080

# Default command to run Tomcat
CMD ["catalina.sh", "run"]
