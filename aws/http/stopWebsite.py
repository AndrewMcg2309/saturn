import requests
import pprint
import json

endpoint = "/stopWebsite"
url = f'https://fyrbzl2e5j.execute-api.eu-west-1.amazonaws.com{endpoint}'

req = requests.post(url)
print(req.status_code)


