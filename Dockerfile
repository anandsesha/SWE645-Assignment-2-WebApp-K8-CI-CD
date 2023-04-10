# Use official Tomcat runtime as a parent image
FROM tomcat:9.0.31-jdk8-openjdk
# FROM tomcat:9.0.72 

# Copy the war file into the container
COPY swe-645-assignment-1.war /usr/local/tomcat/webapps/

# Expose port 8080 for the container
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]