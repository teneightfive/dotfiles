#!/bin/sh 

git pull
source env/bin/activate
pip install -r requirements/local.txt
./manage.py migrate
./manage.py runserver 0.0.0.0:8000 --settings cla_backend.settings.testing