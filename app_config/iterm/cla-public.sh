#!/bin/sh 

cd ~/Sites/moj/cla_public
git co develop
git pull
source env/bin/activate
pip install -r requirements/local.txt
./manage.py runserver_plus 8001