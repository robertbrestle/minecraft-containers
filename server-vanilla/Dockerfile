FROM alpine:latest
RUN apk add --no-cache openjdk21
ENV JAVA_HOME=/usr/bin/java

RUN mkdir -p /opt/vanilla
WORKDIR /opt/vanilla
RUN echo "eula=true" > eula.txt

COPY ./server.jar ./

EXPOSE 25565

ENTRYPOINT ["java", "-Xms1024M", "-Xmx2048M", "-jar", "server.jar", "--nogui"]