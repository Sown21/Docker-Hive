FROM ubuntu:latest

# Mise à jour des paquets et installation des dépendances
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3 nano && \
    rm -rf /var/lib/apt/lists/*

# Définit le répertoire de travail
WORKDIR /root

# Exécute une boucle infinie pour maintenir le conteneur actif
CMD ["bash", "-c", "while true; do sleep 1; done"]
