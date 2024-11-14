#! /bin/bash

# Source the .env file
source .env

BLUE=/home/ubuntu/eliza/blue
GREEN=/home/ubuntu/eliza/green
TEMP=/home/ubuntu/eliza/temp

ssh -i $PEM $SERVER "rm -rf $TEMP"
ssh -i $PEM $SERVER "mkdir -p $TEMP"

scp -i $PEM package.json pnpm-workspace.yaml pnpm-lock.yaml tsconfig.json .npmrc .nvmrc $SERVER:$TEMP
scp -i $PEM .env.production $SERVER:$TEMP/.env

# TODO: Verify
# Use rsync to exclude the tweetcache directory
rsync -avz -e "ssh -i $PEM" --exclude='client-twitter/src/tweetcache' packages $SERVER:$TEMP/packages

scp -i $PEM -r characters $SERVER:$TEMP/characters
scp -i $PEM -r scripts $SERVER:$TEMP/scripts

ssh -i $PEM $SERVER "cd $TEMP && pnpm i && pnpm run build"
ssh -i $PEM $SERVER "rm -rf $BLUE"
ssh -i $PEM $SERVER "mv $GREEN $BLUE && mv $TEMP $GREEN"
#ssh -i $PEM $SERVER "cd $GREEN && pm2 pnpm reload --character=./characters/matt_levAIne.character.json --name 'matt_levaine' --update-env"
