#!/bin/bash

exit_with_error() {
	echo "Erreur: $1"
	exit 1
}

install_docker() {
        echo -e "\nInstallation de Docker..."
        sudo apt-get update
        sudo apt-get install -y docker.io
        sudo usermod -aG docker root
}

if ! command -v docker &> /dev/null; then
        install_docker || exit_with_error "Echec de l'installation de Docker"
        echo -e "\nDocker installé avec succès"
else
        echo -e "\nDocker est déjà installé"
fi

echo -e "Création du dossier ubuntu_docker_save..."
sudo mkdir -p /etc/ubuntu_docker_save || exit_with_error "Impossible de créer le dossier"

if [ -d "Docker-Hive" ]; then
	echo -e "\nLe répertoire github Docker-Hive existe déjà..."
else
	echo -e "\nClonage du code source depuis GitHub..."
	git clone https://github.com/Sown21/Docker-Hive.git || exit_with_error "Echec du clonage"
fi

cd ./Docker-Hive || exit_with_error "Impossible d'accéder au répertoire de l'application"

echo -e "\nConstruction de l'image Docker..."
docker build -t ubuntu . || exit_with_error "Echec de la construction de l'image"

echo -e "\nLancement du conteneur..."
docker run -d --name ubuntu -v /etc/ubuntu_docker_save:/root ubuntu || exit_with_error "Erreur au lancement du conteneur"

echo -e "\n\nInstallation terminée.\nPour vous connecter au conteneur veuillez executer la commande : docker exec -ti ubuntu /bin/bash"
