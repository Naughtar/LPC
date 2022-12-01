#!/bin/bash
#Script: automap.sh
# Nombre: Erick Mejorado Garcia
# Matricula: 1803249
echo "Bienvenido al programa"  
#Se despliega menu de opciones
echo -e "Menu\n1-Escaneo de subred \n2.-Escaneo individual \n3.-Escaneo UDP \n4.-Escaneo de script \n5.-Salir"
read -p "Seleccione una opcion: " op
#Si la opcion a seleccionar es valida y existe se realiza la ejecucion de la operacion
if [ -z $op ]; then
    echo "No se selecciono una opcion valida, saliendo del prorgrama...."
else
  
  case $op in
  
  
      1)read -p "Inserte IP a escanear: " ip
      read -p "Inserte el rango: " rango
      ip+="/"$rango
      nmap "$ip"| tee -a datos.txt;; #Se hace llamado a nmap para el escaneo y mediante pipes se transfieren los datos para guardarse
	
      2)read -p "Inserte IP a escanear: " ip
      nmap -sV -O "$ip"| tee -a datos.txt;;
  
      3)read -p "Inserte IP a escanear: " ip 
      nmap -sU "$ip"| tee -a datos.txt;; #Se llama a nmap para hacer escaneo UDP
  
      4)read -p "Inserte IP a escanear: " ip
      read "inserte la direccion del script" script #Se lee el path del script a usar
      if [ -z $script ]; then
        echo "No se inserto direccion"
        else
            nmap --script="$script" "$ip"| tee -a datos.txt #Se incializa Nmao con el script indicado
      fi;;
      
      5)echo "Saliendo del programa....";;

      *)echo "No se selecciono una opcion valida, saliendo del prorgrama....";;#En caso de no validar opcion se termina programa
  esac

  
fi