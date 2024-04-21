import requests
import pprint
import json

endpoint = "/startWebsite"
url = f'https://fyrbzl2e5j.execute-api.eu-west-1.amazonaws.com{endpoint}'
json_start = {"task":"start"}

req = requests.post(url, json=json_start)
print(req.status_code)
print(req.text)
