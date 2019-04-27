#!/bin/python
# -*- coding: utf-8 -*-

import requests

CITY = "3452925"
API_KEY = "55ad54336b6b6aba170d2c611a36017e"
UNITS = "Metric"
UNIT_KEY = "C"

REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&appid={}&units={}".format(CITY, API_KEY, UNITS))
try:
    # HTTP CODE = OK
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        CITY = REQ.json()["name"]
        print ("{}, {}, {} °{}".format(CITY, CURRENT, TEMP, UNIT_KEY))
    else:
        print("Error: BAD HTTP STATUS CODE " + str(REQ.status_code))
except (ValueError, IOError):
    print("Error: Unable print the data")

