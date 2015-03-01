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
                                                                                                                                                                                                            
#Install dependencies for lamernews                                                                                                                                                                         
#RUN gem install bundler && \                                                                                                                                                                                
#gem install hiredis -v '0.4.5'                                                                                                                                                                              
                                                                                                                                                                                                            
#Running bundle to install other dependencies                                                                                                                                                               
#RUN cd /app/lamernews && bundle                                                                                                                                                                             
                                                                                                                                                                                                            
#Set permissions                                                                                                                                                                                            
RUN chmod a+x /app/lamernews/start.sh                                                                                                                                                                       
                                                                                                                                                                                                            
#Start app                                                                                                                                                                                                  
ENTRYPOINT ["/app/lamernews/start.sh"]           
