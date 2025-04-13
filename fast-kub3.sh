#!/bin/bash

TITLE="src/title.txt"

# Importa tutte le funzioni
source ./functions.sh

# pannello principale
menu(){
    cat $TITLE
    clear
    echo "----------------------------------------"
    echo "Welcome to the FAST-KUB3 Installer"
    echo "----------------------------------------"
    echo "SELECT WHAT YOU WANT DO:"
    echo "1. Basic install"
    echo "2. Install k3s + jellyfin pod"
    echo "3. Remove"
    echo "0. Quit"
    echo -n "Enter your menu choice [1-3]: "

    while :
    do
        read choice
        case $choice in
            1) clear; echo "You have selected the option 1"
               echo "Installing... "
               install;;
            2) clear; echo "You have selected the option 2"
               echo "Installing... "
               install
               deploy_jellyfin;;
            3) clear; echo "You have selected the option 3"
               echo "Removing... "
               remove;;
            0) echo "Quitting..."
               exit;;
            *) echo "invalid option";;
        esac
    done
}

menu
