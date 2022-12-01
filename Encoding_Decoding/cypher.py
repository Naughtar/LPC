#
# Nombre: Erick Mejorado Garcia
# Matricula: 1803249
from  cryptography.fernet import Fernet

def genwrite():
    key = Fernet.generate_key()
    with open('pass.key','wb') as key_file:
        key_file.write(key)

def call_key():
    return open('pass.key','rb').read()

genwrite()


#Encriptacion
key = call_key()
banner = 'Buenas tardes, mi nombre es Erick Mejorado'.encode()
a = Fernet(key)
coded_banner = a.encrypt(banner)
print(coded_banner)

#Desencriptacion
key = call_key()
b = Fernet(key)
decoded_banner = b.decrypt(coded_banner)
print(decoded_banner)