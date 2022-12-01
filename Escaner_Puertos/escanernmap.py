import nmap
#Nombre: Erick Mejorado Garcia
#Matricula: 1803249

def fscan(ip):
    nm = nmap.PortScanner()
    nm.scan(ip,'1-1024','-v -sV')
    # Se indica la ip y los puertos a escanear
    nm.scan(ip, '22-443')
    datos = ''
    for host in nm.all_hosts():
        datos += ('----------------------------------------------------')
        datos += ('\nHost : %s (%s)' % (host, nm[host].hostname()))
        datos += ('\nEstado : %s' % nm[host].state())
        for protocolo in nm[host].all_protocols():
            # Se leeb y almacenan los datos en una variable para enviar
            datos += ('\n----------')
            datos +=('\nprotocolo : %s' % protocolo)
            lport = sorted(nm[host][protocolo].keys())
            for puerto in lport:
                datos += ('\nPuerto: %s\tEstado: %s' % (puerto, nm[host][protocolo][puerto]['state']))
                    
    return datos

def sudp(ip):
    nm = nmap.PortScanner()
    nm.scan(ip, '1-1024', '-v -sU' )
    


def scos(ip):
    nm = nmap.PortScanner()
    datos = nm.scan(ip, '1-1024', '-v -A' )
    print(datos)


def sping(ip):
    nm = nmap.PortScanner()
    nm.scan(ip, '1-1024', '-v -sP' )



if __name__ == '__main__':
    y = True
    while y:
        op = int(input('Seleccione una de las opciones: \n1.-Escaneo Completo \n2.-Escaneo UDP \n3.-Escaneo de sistema Operativo \n4.-Escaneo de red con ping\n'))
        if (op>0 and op<5):
            y = False
        else:
            print('Seleccione una opcion valida')
    ip = input('Inserte la ip a escanear\n')
    if(op==1):
        datos = fscan(ip)
        print(datos)
    elif(op==2):
        sudp(ip)
    elif(op==3):
        scos(ip)
    elif(op==4):
        sping(ip)
    