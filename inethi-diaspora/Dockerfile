FROM inethi/diaspora:1.0

# Expose these ports to the outside
EXPOSE 3000

# Copy startup script to root directory
COPY start-services.sh /start-services.sh

# Run the Startup Script
ENTRYPOINT ["/start-services.sh"]
