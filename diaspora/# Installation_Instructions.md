# Installation Instructions:

## Install Dependencies: 
sudo apt-get install build-essential git curl imagemagick libmagickwand-dev nodejs redis-server libcurl4-openssl-dev libxml2-dev libxslt-dev libgmp-dev libmysqlclient-dev

## Install MYSQL Packages 
apt-get install nano vim mysql-client libmysqlclient-dev mysql-server

## Install RVM Packages
apt-get install gawk libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake bison libffi-dev libreadline6-dev

## MYSQL Setup:

### Setting MYSQL Root Password
user: root
password: root

### Creating a user for DB
mysql -u root -p

### MYSQL Commands:

 - CREATE USER 'diaspora'@'localhost' IDENTIFIED BY 'diaspora'; 
 - GRANT ALL PRIVILEGES ON `diaspora_%`.* TO 'diaspora'@'localhost';

### Testing new MYSQL User
mysql -u diaspora -p

# Create Diaspora User
adduser --disabled-login diaspora
su diaspora
cd ~ 

# diaspora user... run command:
curl -L https://s.diaspora.software/1t | bash

# Update ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Setup diaspora as sudo user
vim /etc/sudoers
diaspora  ALL=(ALL:ALL) ALL

# Set diaspora password inside root account
usermod --password $(openssl passwd -1 diaspora) diaspora

# as diaspora user... run the commands: 
 - rvm autolibs read-fail
 - rvm autolibs enable
 - rvm install 2.3

# As root install (Very Important): Missing required packages: 
 - libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake bison libffi-dev libreadline6-dev

## Then re-run to download ruby:
 - rvm install 2.3

# It's time to download diaspora*! As your diaspora user run:

cd ~
git clone -b master https://github.com/diaspora/diaspora.git
cd diaspora

# Configuration

 - cp config/database.yml.example config/database.yml
 - cp config/diaspora.yml.example config/diaspora.yml

# Edit using "vim config/database.yml"
 - common = <<: *mysql
 - username: root
 - password: root

# Edit using "vim config/diaspora.yml"
 - environment.url: https://diaspora.inethi.net
 - environment.certificate_authorities: "uncomment ubuntu ca-certificates"
 - server.rails_environment: Set this to "production"
 - environment.require_ssl:

# It's time to install the Ruby libraries required by diaspora*:
# make sure your are inside the "git diaspora" directory
gem install bundler
RAILS_ENV=production bin/bundle install --jobs $(nproc) --deployment --without test production --with mysql

## Database setup
RAILS_ENV=production bin/rake db:create db:schema:load

## Precompile assets
RAILS_ENV=production bin/rake assets:precompile

# RAILS Production Mode (very Important Line)
RAILS_ENV="production" bin/bundle exec unicorn -c config/unicorn.rb -D

RAILS_ENV=production bundle exec sidekiq

# Start Diaspora
./script/server

# System IP Changes
## Setup pod.diaspora.local inside your computers "/etc/hosts" file
127.0.0.1 or IP	pod.diaspora.local

# Updating Diaspora
cd /user/local/app/diaspora
git pull origin master


# Setup Nginx Production Enviroment for Diaspora
See attached "diaspora_nginx" config file

##create your own self-signed certificates
 - sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
 - sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048 

 link: https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04 
