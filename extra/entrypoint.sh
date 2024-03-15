#!/bin/ash

[ -f /run-pre.sh ] && /run-pre.sh

# Define the file version
GRAV_VERSION="1.7.44"
URL="https://getgrav.org/download/core/grav-admin/${GRAV_VERSION}"

# Check if the target folder exists, create if necessary
if [ ! -d /var/www/html ]; then
  mkdir -p /var/www/html
  chown -R ubuntu:ubuntu /var/www/html
fi

if [ ! -d /var/www/html/user ]; then
  # Download Grav files:
  wget -O /tmp/page.zip ${URL}
  
  # Extract the Grav archive:
  unzip /tmp/page.zip -d /tmp/grav
  cd /tmp/grav/grav-admin
  tar -zcvf /tmp/grav.tar .
  tar -xf /tmp/grav.tar -C /var/www/html/

  # Clean up and finalise:
  rm /tmp/page.zip && rm /tmp/grav.tar
  rm -r /tmp/grav
  chown -R ubuntu:ubuntu /var/www/html
fi

chown -R ubuntu:ubuntu /var/www/html
chown -R ubuntu:ubuntu /var/lib/nginx/html

find /usr/html -type f | xargs chmod 664
find /usr/html -type d | xargs chmod 775
find /usr/html -type d | xargs chmod +s

# start php-fpm
php-fpm82

# start nginx
mkdir -p /tmp/nginx/
chown -R ubuntu:ubuntu /tmp/nginx
nginx -g 'daemon off;'
