#!/bin/bash
cd ~/git/sslscan
perl scanssl-beta.pl
cp sslscan.html /var/www/html/index.html
cp -R /root/git/sslscan/json/ /var/www/html/.
chown -R www-data:www-data /var/www/html
chmod u+x /var/www/html/json/
chmod g+x /var/www/html/json/

