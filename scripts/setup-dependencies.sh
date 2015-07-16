#!/usr/bin/env bash

echo ">>>>>>>>>>>>>> Updating apt-get"
sudo apt-get -y update

echo ">>>>>>>>>>>>>> Installing wget"
sudo apt-get -y install wget 

echo ">>>>>>>>>>>>>> Installing java"
sudo apt-get -y install default-jre

echo ">>>>>>>>>>>>>> Installing postgresql"
sudo apt-get -y install postgresql postgresql-contrib

echo ">>>>>>>>>>>>>> Installing Sonar"
rm -rf /etc/apt/sources.list.d/sonar.list
echo 'deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/' > /tmp/sonar.list
sudo cp /tmp/sonar.list /etc/apt/sources.list.d/
rm /tmp/sonar.list
sudo apt-get -y update
sudo apt-get -y install sonar --force-yes
sudo dpkg -i /vagrant/binaries/sonar_5.1.1_all.deb

echo ">>>>>>>>>>>>>> Setting up Sonar DB and starting webserver"
sudo su - postgres -c "/vagrant/scripts/create-sonar-db.sh"
sudo rm /opt/sonar/conf/sonar.properties
sudo cp /vagrant/conf/sonar.properties /opt/sonar/conf/sonar.properties

sudo /etc/init.d/sonar start
