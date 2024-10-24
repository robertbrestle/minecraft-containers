FROM alpine:latest
RUN apk add --no-cache bash wget unzip openjdk8
ENV JAVA_HOME=/usr/bin/java

RUN mkdir -p /opt/server
WORKDIR /opt/server

ENV PACK=1.6.4
RUN wget https://solder.endermedia.com/repository/downloads/the-1122-pack/the-1122-pack_${PACK}.zip -O /opt/server/server_${PACK}.zip
RUN unzip server_${PACK}.zip -d /opt/server

RUN echo "eula=true" > eula.txt
RUN sed -i 's/Xmx4G/Xmx8G/g' /opt/server/LaunchServer.sh
RUN echo -e "\nspawn-protection=-1" >> /opt/server/server.properties
RUN chmod +x /opt/server/LaunchServer.sh

EXPOSE 25566

ENTRYPOINT ["/opt/server/LaunchServer.sh"]