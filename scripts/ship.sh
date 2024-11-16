#! /bin/bash

set -e

# Source the .env file
source .env

GREEN=/home/ubuntu/squid/green

ssh -i $PEM $SERVER "mkdir -p $GREEN"
scp -i $PEM -r characters .env docker-compose.yml $SERVER:$GREEN
ssh -i $PEM $SERVER "cd $GREEN && docker compose pull && docker compose up -d --remove-orphans && docker compose restart"
ssh -i $PEM $SERVER "cd $GREEN && docker image prune -f && docker image prune -a -f && docker system prune -f"