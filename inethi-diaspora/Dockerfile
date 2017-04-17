# Diaspora [Production]
# This Dockerfile Setups an already created Diaspora Image with the ability to run.
FROM diaspora.inethi.net

# Copy startup script to root directory
COPY start-services.sh /start-services.sh

EXPOSE 443

# Run the Startup Script
ENTRYPOINT ["/start-services.sh"]


# docker run -it -p 443:443 --name diaspora.inethi.net --hostname=diaspora.inethi.net diaspora.inethi.net