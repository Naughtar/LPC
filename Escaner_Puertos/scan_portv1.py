#!/usr/bin/python
# -*- coding uft-8 -*-
#Nombre: Erick Mejorado Garcia
#Matricula: 1803249
import sys
from socket import *

#variables de inicio
host = sys.argv[1]
portstrs = sys.argv[2].split("-")
#Inicio y fin de puertos
start_port = int(portstrs[0])
end_port = int(portstrs[1])

target_ip = gethostbyname(host)
opened_ports = []

for port in range(start_port,end_port):
    sock = socket(AF_INET, SOCK_STREAM)
    sock.settimeout(10)
    result = sock.connect_ex((target_ip, port))
    if result == 0:
        opened_ports.append(port)

for i in opened_ports:
    print (i)