#!/bin/sh 

git pull
source env/bin/activate
pip install -r requirements/local.txt
./manage.py migrate
./manage.py testserver initial_groups.json kb_from_knowledgebase.json initial_category.json test_provider.json initial_mattertype.json test_auth_clients.json initial_media_codes.json test_rotas.json test_casearchived.json test_providercases.json test_provider_allocations.json  --noinput --settings cla_backend.settings.testing