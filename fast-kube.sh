#!/bin/bash

# Installazione K3s
echo "Installing K3s..."
curl -sfL https://get.k3s.io | sh -

# Verifica installazione K3s
echo "Checking K3s..."
sudo systemctl status k3s

# Installazione K9s
echo "Installazione K9s..."
wget -qO- https://github.com/derailed/k9s/releases/download/v0.24.1/k9s_Linux_armv7.tar.gz | tar zxvf - -C /tmp/
sudo mv /tmp/k9s /usr/local/bin

# Configurazione K9s
echo "Configurazione K9s..."
# Configura KUBECONFIG per K9s se necessario
# export della configurazione 


echo "Would you like to also startup a jellyfin istance?"
# Avvio pod Jellyfin
echo "Avvio pod Jellyfin..."
# Crea e applica un file YAML per il deployment di Jellyfin
kubectl apply -f jellyfin-deployment.yaml

# Verifica stato pod
echo "Verifica stato pod..."
kubectl get pods
