#!/bin/bash --login 
# Diaspora [Production]
# This script starts the "Diaspora Development version".

# Files to remove on strtup
rm /var/run/dbus/system_bus_socket
rm /home/diaspora/diaspora/tmp/diaspora.sock

# Set Permissions
sudo chmod -R 775 /home/diaspora/diaspora/
sudo usermod -a -G www-data diaspora

# Starting Important Services
service mysql start
service redis-server start
service nginx start
service apparmor start
service dbus start

# Starting Diaspora Service
su -l -c "cd /home/diaspora/diaspora && ./script/server $1" diaspora