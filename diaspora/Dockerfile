FROM ubuntu

MAINTAINER Inethi Network

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get install diaspora-installer \
	&& apt-get clean \


EXPOSE 443
CMD ["diaspora"]