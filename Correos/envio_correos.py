# Nombre: Erick Mejorado Garcia
# Matricula: 1803249
import smtplib
from pathlib import Path
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.utils import COMMASPACE, formatdate
from email import encoders

def correo(remitente, destino, asunto, mensaje , arch=[],
              username='', password=''):        
        
    msg = MIMEMultipart()
    msg['From'] = remitente #Remitente
    msg['To'] = COMMASPACE.join(destino) #Lista de destinatario(s)
    msg['Date'] = formatdate(localtime=True) #Fecha del correo
    msg['Subject'] = asunto #Asunto del correo

    msg.attach(MIMEText(mensaje,"html"))  #mensaje: Cuerpo del correo

    for path in arch: #Lista de directorios de archivos a adjuntar
        part = MIMEBase('application', "octet-stream")
        with open(path, 'rb') as file:
            part.set_payload(file.read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition',
                        'attachment; filename={}'.format(Path(path).name))
        msg.attach(part)

    smtp = smtplib.SMTP('smtp.gmail.com', 587) #Se declara el servidor y puerto a usar
    smtp.ehlo() #Saludo
    smtp.starttls() #Inicia sesion TLS
    smtp.login(username, password) #Se inicia sesion con las credenciales
    smtp.sendmail(remitente, destino, msg.as_string()) #Se envia el correo con el adjunto
    smtp.quit()
    
    
if __name__ == '__main__':
    try:
        correo("@gmail.com",["@gmail.com"],"Prueba de envio (script python) - 1803249",
        "<b>Practica 12 </b><br>Ejercicio de la practica 12 para envío de correos <br><b>Alumno: </b>Erick Mejorado Garcia <br><b>Matricula: </b>1803249",
        [r"C:\Users\Public\imagenes\fcfm_cool.png"], "@gmail.com","")
        #uso: correo('remitente',['destinatario(s)'],'asunto','cuerpo','adjunto','usuario','contrasena de la app')
        except Exception as e:
            print('Error: ',e)