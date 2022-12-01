import base64
#
# Nombre: Erick Mejorado Garcia
# Matricula: 1803249
print ("Bienvenido a codificacion en python")
frase = input("Proporciona una frase para codificar: ")

frase_bytes = frase.encode('ascii')

base64_bytes = base64.b64encode(frase_bytes)

base64_message = base64_bytes.decode('ascii')

print("La frase codificada en base 64 es: ")
print(base64_message)