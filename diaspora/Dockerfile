# This is a Development version of Diaspora

FROM ubuntu 

# Installaing Ubuntu Packages needed for Development Enviroment
RUN apt-get update && apt-get install -y \
    	sudo \
    	build-essential \
    	git \
    	curl \
    	imagemagick \
    	libmagickwand-dev \
    	nodejs \
    	redis-server \
    	libcurl4-openssl-dev \
    	libxml2-dev \
    	libxslt-dev \
    	libgmp-dev \
    	libmysqlclient-dev \
    	libmagickwand-dev \
    	cmake

# Installing MYSQL Database requirements
RUN apt-get install -y \
		nano \
		vim \
		mysql-client \
		libmysqlclient-dev \
		mysql-server

# Starting the MYSQL Database Server
CMD	/etc/init.d/mysql start

# Setting up MYSQL DB with new user account
CMD mysql -u root -p
CMD	CREATE USER 'diaspora'@'localhost' IDENTIFIED BY 'diaspora';
CMD GRANT ALL PRIVILEGES ON `diaspora_%`.* TO 'diaspora'@'localhost';



    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

ADD default /etc/nginx/sites-available/default

EXPOSE 80
CMD ["nginx"]