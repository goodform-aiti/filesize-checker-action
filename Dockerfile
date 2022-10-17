FROM php:8.1-cli

RUN apt-get update && \
    apt-get autoremove -y && \
    apt-get clean
    
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
