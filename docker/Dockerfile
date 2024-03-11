FROM tomcat:8.5.37-jre8
MAINTAINER satyasaisandeep901@gmail.com
RUN apt-get update 
# Copy the script into the container
COPY log_generator.sh /log_generator.sh
# Define environment variables
#ENV AWS_ACCESS_KEY_ID="your_access_key_id"
#ENV AWS_SECRET_ACCESS_KEY="your_secret_access_key"
#ENV S3_BUCKET_NAME="your_bucket_name"
#ENV AWS_REGION="your_aws_region"
# Give execute permissions to the script
RUN chmod +x /log_generator.sh
ADD  target/satyasaisandeepLogin-5.0.war /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"] && ["/log_generator.sh", "run"]