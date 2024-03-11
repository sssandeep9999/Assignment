
# Before installing Docker, you should update the package index
echo "installing Docker"
sudo apt-get update -y
# install docker
sudo apt-get install docker -y
# start docker
sudo systemctl start docker
# enable docker service
sudo systemctl enable docker
# chech docker version
docker --version

# create docker image and container

# clone it repository


git clone https://github.com/sssandeep9999/Assignment.git

mkdir /home/web_application_data/
docker build -t prodlabsappplicaion:1 .

docker run -d -p 8081:8080 --volume /home/web_application_data/:/home/web_application_data/ 6ee519a7aa12

docker exec <container ID> /log_generator.sh

aws s3 cp /home/web_application_data s3://prodlabassignment/