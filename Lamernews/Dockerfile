FROM debian:latest                                                                                                                                                                                          
                                                                                                                                                                                                            
ENV DEBIAN_FRONTEND noninteractive                                                                                                                                                                          
                                                                                                                                                                                                            
# Install dependencies needed by Rails, followed by cleanup                                                                                                                                                 
RUN apt-get update -q && \                                                                                                                                                                                  
    apt-get install -qy git ruby1.9.1 ruby-dev build-essential && \                                                                                                                                         
    apt-get clean                                                                                                                                                                                           
                                                                                                                                                                                                            
# https://github.com/docker/docker/issues/4032                                                                                                                                                              
ENV DEBIAN_FRONTEND newt                                                                                                                                                                                    

#Set Gems path
ENV GEM_HOME /gems/lamernews
ENV PATH /gems/lamernews/bin:$PATH

#get git clone of scripts                                                                                                                                                                             
RUN cd / && git clone https://github.com/appdesign1987/scripts.git                                                                                                                                  
                                                                                                                                                                                                            
#Set permissions              
RUN chmod a+x /scripts/start.sh                                                                                                                                                                       
                                                                                                                                                                                                            
#Start app                                                                                                                                                                                                  
ENTRYPOINT ["/scripts/start.sh"]           
