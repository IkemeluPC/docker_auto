#!/bin/bash
#script to automate docker image build and upload to dockerhub
#Author: IkemeluPC
today=`date`
user=`whoami`
dockeruser=yourcase
password=yourcase
dockerrepo=yourcase
versions=( 18.04 20.04 21.10 16.04 22.04 )
for i in ${versions[@]}; do
docker build -t $dockeruser/$dockerrepo:$i --build-arg versions=groovy .
docker login -u $dockeruser -p $password
docker push $dockeruser/$dockerrepo:$i
echo "$user is running a docker container:$i on $today"
sleep 5
echo " Images have been uploaded to your dockerhub repository !! "
done
