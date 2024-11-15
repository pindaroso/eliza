#! /bin/bash

set -e

# Source the .env file
source .env

GREEN=/home/ubuntu/squid/green

scp -i $PEM -r characters .env nAIssim_taleb.env docker-compose.yml $SERVER:$GREEN
ssh -i $PEM $SERVER "cd $GREEN && docker compose pull && docker compose up -d --remove-orphans && docker compose restart"