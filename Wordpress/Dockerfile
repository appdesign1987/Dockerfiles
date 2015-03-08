#Wordpress Dockerfile
FROM jeroen/apache
MAINTAINER Fernando Mayo <fernando@tutum.co>, Feng Honglin <hfeng@tutum.co>

# Install plugins
RUN apt-get update && \
  apt-get -y install php5-mysql php5-gd git && \
  rm -rf /var/lib/apt/lists/*

# Git clone scripts repo
RUN cd / && git clone https://github.com/appdesign1987/scripts.git

# Make sure scripts are executable
RUN cd /scripts && chmod +x *.sh

# Modify permissions to allow plugin upload
RUN chown -R www-data:www-data  /var/www

EXPOSE 80

#Start app                                                                                                                                                                                                  
ENTRYPOINT ["/scripts/startWordpress.sh"]
