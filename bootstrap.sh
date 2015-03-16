#!/bin/bash
#
# Used to 'provision' the vagrant machine. Basically is run after the machine
# is created so you don't have to worry about installing everything yourself.

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# NodeJS and other stuff required by the 'api' and 'io' to run properly,
# basically all sorts of MongoDBs, Redises etc...

curl -sL https://deb.nodesource.com/setup | sudo bash -

apt-get update
apt-get install -y git nodejs build-essential
apt-get install -y mongodb-server redis-server

apt-get install -y apache2
apt-get install -y php5 libapache2-mod-php5

apt-get install -y php5-dev php5-cli php-pear
no | pecl install mongo

echo 'extension=mongo.so' >> /etc/php5/apache2/php.ini

/etc/init.d/apache2 restart

# Build tools for development

gem install sass
npm install -g gulp bower
