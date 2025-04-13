#!/bin/bash

JELLYFIN_DEPLOYMENT="src/deployment/jellyfin-deployment.yaml"

install(){
    install_k3s
    install_k9s
    config_k9s
}

install_k3s() {
    echo "Installing K3s..."
    curl -sfL https://get.k3s.io | sh -
}

install_k9s (){
    echo "Installing K9s..."
    cd ~
    wget -qO- https://github.com/derailed/k9s/releases/download/v0.24.1/k9s_Linux_armv7.tar.gz | tar zxvf - -C /tmp/
    sudo mv /tmp/k9s /usr/local/bin
}

config_k9s (){
    echo "Configuring K9s..."
    echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc
}

deploy_jellyfin() {
    echo "Deploying Jellyfin pod..."
    mkdir -p ~/deployment/ && cp $JELLYFIN_DEPLOYMENT ~/deployment/jellyfin-deployment.yaml
    kubectl apply -f ~/deployment/jellyfin-deployment.yaml
}

remove() {
    echo "Removing Jellyfin deployment..."
    kubectl delete -f ~/deployment/jellyfin-deployment.yaml 2>/dev/null

    echo "Uninstalling K3s..."
    /usr/local/bin/k3s-uninstall.sh 2>/dev/null

    echo "Removing K9s..."
    sudo rm -f /usr/local/bin/k9s

    echo "Cleanup complete."
}
