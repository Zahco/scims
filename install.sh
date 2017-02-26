#!/bin/bash

echo "Copie des sources web..."
cp -r scims/* /var/www/html/projet
cp scims/.h* /var/www/html/projet

bdduser="projet"
bddpassword="tejorp"
bddbase="projet"

echo "Importation de la base de données..."
mysql --user=$bdduser --password=$bddpassword $bddbase < scims/Domain/SQL/scims.sql

echo "Configuration Apache..."
echo -e "<Directory /var/www/html>\n\tAllowOverride All\n</Directory>" >> /etc/apache2/apache2.conf
echo -e "<VirtualHost *:8081>\n\tDocumentRoot /var/www/html/projet\n</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf
echo -e "Listen 8081" >> /etc/apache2/ports.conf
a2enmod rewrite
service apache2 restart

echo "Installation terminé."
