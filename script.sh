#!/bin/bash
hostname="http://localhost:"
port=8888
sudo docker build -t docker_image .
sudo docker run -p $port:$port -itd docker_image
exit_code=$?

if [ $exit_code -eq 0 ]
then
  echo "The container is running"
else
  echo "The container is not running" 
fi
echo "Exit code of the container" $exit_code
sleep 3

check=$(curl -Is $hostname$port | grep '200' | wc -l)

if [ $check -eq 0 ]
then
  echo "The app does not working"
else
  echo "The app is working "
fi


