#! /bin/bash

set -e

# Source the .env file
source .env

BLUE=/home/ubuntu/squid/blue
GREEN=/home/ubuntu/squid/green
TEMP=/home/ubuntu/squid/temp

scp -i $PEM -r characters .env docker-compose.yml $SERVER:$TEMP

ssh -i $PEM $SERVER "mkdir -p $GREEN"
ssh -i $PEM $SERVER "rm -rf $BLUE"
ssh -i $PEM $SERVER "mv $GREEN $BLUE && mv $TEMP $GREEN"
ssh -i $PEM $SERVER "cd $GREEN && docker compose up -d"