#!/bin/bash
#Script superscan.sh
#Fecha 28/9/22 Nombre: Erick Mejorado Garcia
#
date
    echo "---------------------------"
    echo "   Menu Principal"
    echo "---------------------------"
    echo "1. Net Discover"
    echo "2. Port Scan"
    echo "3. Welcome"
    echo "4. Salir"
read -p "Opción  [ 1 - 4 ] " c
case $c in
        1) echo "Opcion Net Discover seleccionada"
		./netdiscover.sh;;
        2)echo "Opcion Port Scan seleccionada"
		read -p "Inserte ip: " ip
        ./portscanv1.sh "$ip";;
		3)echo "Opcion Welcome seleccionada"
        ./welcome.sh;;
		4)echo "Saliendo...";;
esac
