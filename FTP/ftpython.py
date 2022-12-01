from ftplib import FTP
import os
#
# Nombre: Erick Mejorado Garcia
# Matricula: 1803249
filename =  'C:\\Users\Erick M\ADVERTENCIA.txt'
ftp = FTP('172.25.8.49')
ftp.login("travis", "1803249")
ftp.cwd("upload")
ftp.retrlines("LIST")
print(filename)
with open(filename,'rb') as contents:
    ftp.storbinary('STOR ADVERTENCIA.txt', contents)
ftp.quit()