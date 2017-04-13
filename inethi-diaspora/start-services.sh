#!/bin/bash --login 
# This script starts the "Diaspora Development version".

# Starting MYSQL Service
/etc/init.d/mysql start

# Starting Diaspora Service
su -l -c "cd /home/diaspora/diaspora && ./script/server $1" diaspora
