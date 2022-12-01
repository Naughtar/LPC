import requests
import json
#
if __name__ == '__main__':
    url = 'https://httpbin.org/post'
    argumentos = {'nombre':'Erick','matricula':'1803249','curso':'Programacion para Ciberseguridad'}
    
    response = requests.post(url, params=argumentos)
    
    if response.status_code == 200:
        print(response.content)
    