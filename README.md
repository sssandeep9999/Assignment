# Assignment

Here I implemented this assignment to create an infra using terraform and perform application deployment on a docker container. Now whatever the data will be uploaded into application like files those data will be uploaded into s3 bucket.

AWS resources used in his assignment  (EC2 instance, IAM user, IAM Role,IAM Policy, AutoScaling, CloudFront, S3, Route53 )

# Prerequisite:- 
<<<<<<< HEAD
Create a IAM User and create keys.
Create a IAM role.
Create a custom IAM policy for s3 e.g., s3:GetObject, s3:PutObject, etc. 
=======
Create a IAM User and create keys
Create a IAM role
Create a custom IAM policy for s3 e.g., s3:GetObject, s3:PutObject, etc 
>>>>>>> 2e379ea207b01029b72a6e120ce0f8cfa471e72f

# Infrastructure as Code:-
Under Terraform dir i was written terraform code for each resource that was specified in assignment and converted as terraform modules.

# S3 module:-
This module configuration creates an S3 bucket with versioning enabled and applies a bucket policy defined in a JSON file. The policy likely defines permissions for accessing objects in the bucket, such as who can read, write, or delete objects, and may include conditions for access.

# Ec2 module:-
This module is used to create the ec2 instance. Under ec2 module I specified a user data to install docker and create an image from docker file and it will run a docker container. Now we need to use a host path method to make you data persist now from our host server we can update and retrieve the data to s3 using shell script

# AutoScaling module:-
This AutoScaling module configuration will set up an Auto Scaling group that uses a launch configuration to launch instances based on the specified AMI and instance type. The Auto Scaling group automatically adjusts the number of instances based on the configured minimum, maximum, and desired capacities.

# CloudFront module:-
This CloudFront distribution module setup and optimizes the delivery of the web application, improving performance, scalability, and security for end-users across different geographical regions.

# Route53 module:-
This configuration creates a DNS record in Route 53 to map the specified subdomain to the domain name of the CloudFront distribution, allowing users to access the web application using the specified subdomain.

Now by including all these modules I have written a main.tf file and all the required variables will be specified under main only i didn't use a separate file for variables. Now to execute this code we need to make sure aws cli is installed in your working environment and configure it with our IAM user access key and secret key and check the connection to your aws account and start the execution process. Using terraform commands.

 terraform init
 terraform plan
 terraform apply
 terraform destroy

# Docker:-
We are using docker to containerize our application with volume type hostpath. For these we need to create a dockerfile and create our own docker image and create a container.
Now our application data will be stored in the host server as persistent. Now we can use any scripted file to copy, delete or update the data from our host server to s3 bucket. 

Host path i used /home/web_application_data

Command to build docker image
docker build -t prodlabsappplicaion:1 .

Command to run docker container 
docker run -d -p 8081:8080 --volume /home/web_application_data/:/home/web_application_data/ <docker image id>



After implementing everything check the web application and the application data was updating into s3 bucket or not








