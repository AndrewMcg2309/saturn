import requests
import pprint
import json

endpoint = "/statusWebsite"
url = f'https://fyrbzl2e5j.execute-api.eu-west-1.amazonaws.com{endpoint}'

req = requests.get(url)
print(req.status_code)


