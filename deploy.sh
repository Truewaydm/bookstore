#!/bin/bash

ssh root@209.38.237.156 'rm -r ~/bookstore'
ssh root@209.38.237.156 'git clone https://github.com/Rainbowdm/bookstore.git'

ssh root@209.38.237.156 'docker stop bookstore-api'
ssh root@209.38.237.156 'docker container rm bookstore-api'

ssh root@209.38.237.156 'docker build -t bookstore-api-build ~/bookstore'
ssh root@209.38.237.156 'docker run --name=bookstore-api -d -e MODULE_NAME="main" -e PORT="8000" -e PRODUCTION="true" -p 8000:8000 bookstore-api-build'