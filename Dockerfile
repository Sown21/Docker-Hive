FROM ubuntu:latest

RUN apt-get update -yq \
    && apt-get upgrade -yq \
    && apt-get install curl wget nano unzip screen -yq \
    && apt-get clean -y

WORKDIR /root
 
CMD tail -f /dev/null

