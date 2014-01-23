#!/bin/sh
sudo -i
apt-get update
apt-get -y install build-essential
apt-get -y install python-software-properties

add-apt-repository -y ppa:ondrej/php5-oldstable
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

apt-get update

apt-get -y install vim
apt-get -y install git-core
apt-get -y install jenkins
apt-get -y install php5
apt-get -y install php5-cli
apt-get -y install php5-cgi
apt-get -y install php5-soap
apt-get -y install php5-mcrypt
apt-get -y install php5-mbstring
apt-get -y install php5-intl
apt-get -y install php5-xdebug
apt-get -y install php-apc
apt-get -y install php-pear

pear config-set auto_discover 1
pear channel-discover pear.phpqatools.org
pear channel-discover pear.phing.info
pear install phpqatools/phpqatools
pear install -a phing/phing

cp /vagrant/files/php.ini /etc/php5/cli/php.ini && echo "installed /etc/php5/cli/php.ini"

/etc/init.d/jenkins start