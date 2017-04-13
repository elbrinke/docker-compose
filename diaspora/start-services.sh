#!/bin/sh

# Starting MYSQL Service 
/etc/init.d/mysql start

# Chaning to "diaspora" Account
sudo -iu diaspora

# Change Directory
cd ~
cd diaspora/

# Execute the "Diaspora Starting Script"
./script/server
