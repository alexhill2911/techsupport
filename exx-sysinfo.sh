#!/bin/bash


echo "          PLEASE WAIT WHILE SCRIPT IS IN PROGRESS ......."

# Set OS distribution variable
. /etc/os-release



case "$ID" in
  rhel*|centos*)

	  printf "\e[93m%s\e[0m\n" "Distribution OS is $ID, Gathering Systems Information"
	  echo " "

################################
# ========= Variables ==========
################################

FILE=$(hostname)_$(date +%Y%m%d).txt
NvidiaDriverVersion=$(cat /proc/driver/nvidia/version )
DockerVersion=$(docker version | egrep -A1 Client)
NvidiaDockerVer=$(yum list installed | grep nvidia-docker2 | awk '{print $2}' )
DockerPackages=$(docker images | awk '{print $1":"$2}')
DockerInstall=$(docker run hello-world)


echo "################################" >> /tmp/$FILE
echo "NVIDIA Driver Version" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$NvidiaDriverVersion" >> /tmp/$FILE
echo " "

echo "################################" >> /tmp/$FILE
echo "Docker Version" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$DockerVersion" >> /tmp/$FILE
echo " "

echo "################################" >> /tmp/$FILE
echo "NVIDIA Docker Version" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$NvidiaDockerVer" >> /tmp/$FILE
echo " "

echo "################################" >> /tmp/$FILE
echo "Docker Packages Installed" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$DockerPackages" >> /tmp/$FILE
echo " "

echo "################################" >> /tmp/$FILE
echo "Docker Install Validation" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$DockerInstall" >> /tmp/$FILE
echo " "




# Clean up at end of script
docker ps -a --filter status=exited --format {{.ID}} | xargs docker rm > /dev/null 2>&1

;;

ubuntu*)

	  printf "\e[93m%s\e[0m\n" "Distribution OS is $ID, Gathering Systems Information"
	  echo " "

################################
# ========= Variables ==========
################################

FILE=$(hostname)_$(date +%Y%m%d).txt
NvidiaDriverVersion=$(cat /proc/driver/nvidia/version )
DockerVersion=$(docker version | egrep -A1 Client)
NvidiaDockerVer=$(dpkg -l | grep nvidia-docker2 | awk '{print $2"      "$3}')
DockerPackages=$(docker images | awk '{print $1":"$2}')
DockerInstall=$(docker run hello-world)


echo "################################" >> /tmp/$FILE
echo "NVIDIA Driver Version" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$NvidiaDriverVersion" >> /tmp/$FILE
echo " "

echo "################################" >> /tmp/$FILE
echo "Docker Version" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$DockerVersion" >> /tmp/$FILE
echo " "

echo "################################" >> /tmp/$FILE
echo "NVIDIA Docker Version" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$NvidiaDockerVer" >> /tmp/$FILE
echo " "

echo "################################" >> /tmp/$FILE
echo "Docker Packages Installed" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$DockerPackages" >> /tmp/$FILE
echo " "

echo "################################" >> /tmp/$FILE
echo "Docker Install Validation" >> /tmp/$FILE
echo "################################" >> /tmp/$FILE

echo "$DockerInstall" >> /tmp/$FILE
echo " "

# Clean up at end of script
docker ps -a --filter status=exited --format {{.ID}} | xargs docker rm > /dev/null 2>&1

;;
esac
