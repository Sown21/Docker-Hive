FROM ubuntu:latest

# Mise à jour des paquets et installation des dépendances
RUN apt-get update -yq \
    && apt-get upgrade -yq \
    && apt-get install curl wget nano unzip screen -yq \
    && apt-get clean -y

WORKDIR /root
 
CMD tail -f /dev/null
#CMD ["bash", "-c", "while true; do sleep 1; done"]
