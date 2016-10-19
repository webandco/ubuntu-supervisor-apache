apt-get update

#install git
apt-get -y install git

#install apache-php stack
apt-get -y install apache2 libapache2-mod-php5 git ssh php5-mysql php5-gd php-pear php5-curl php5-cgi php5-cli php5-common php5-json php5-readline curl lynx-cur

#enable mods
a2enmod php5
a2enmod rewrite

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php5/apache2/php.ini
sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php5/apache2/php.ini
sed -i "s/;error_log =.*$/error_log = \\/var\\/log\\/apache2\\/php.log/" /etc/php5/apache2/php.ini
sed -i "s/;date.timezone =.*/date.timezone = europe\\/vienna/" /etc/php5/apache2/php.ini

#setup composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

chmod 777 /config/bootstrap.sh