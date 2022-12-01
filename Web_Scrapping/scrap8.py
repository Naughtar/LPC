import requests
from bs4 import BeautifulSoup
url = 'https://realpython.github.io/fake-jobs/'
page = requests.get(url)

soup = BeautifulSoup(page.content,"html.parser")
results = soup.find(id='ResultsContainer')

job_elements = results.find_all("div",class_="card-content")
python_jobs = results.find_all(
"h2", string =lambda text: "python" in text.lower()
)

for job_element in python_jobs:
    title_element = job_element.find('h2',class_="title")
    company_element = job_element.find('h3',class_="company")
    location_element = job_element.find('p',class_="location")
    print(title_element.text.strip())
    print(company_element.text.strip())
    print(location_element.text.strip())
    print()
