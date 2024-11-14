#! /bin/bash

set -e

# Source the .env file
source .env

BLUE=/home/ubuntu/eliza/blue
GREEN=/home/ubuntu/eliza/green
TEMP=/home/ubuntu/eliza/temp

rsync -avz -e "ssh -i $PEM" --exclude='node_modules' package.json pnpm-workspace.yaml pnpm-lock.yaml tsconfig.json .npmrc .nvmrc $SERVER:$TEMP
rsync -avz -e "ssh -i $PEM" --exclude='node_modules' .env.production $SERVER:$TEMP/.env

rsync -avz -e "ssh -i $PEM" --exclude='node_modules' packages $SERVER:$TEMP
rsync -avz -e "ssh -i $PEM" --exclude='node_modules' characters $SERVER:$TEMP
rsync -avz -e "ssh -i $PEM" --exclude='node_modules' scripts $SERVER:$TEMP

ssh -i $PEM $SERVER "cd $TEMP && pnpm i && pnpm build"
ssh -i $PEM $SERVER "rm -rf $TEMP/packages/client-twitter/src/tweetcache"
ssh -i $PEM $SERVER "cp -R $GREEN/packages/client-twitter/src/tweetcache $TEMP/packages/client-twitter/src/tweetcache"

ssh -i $PEM $SERVER "rm -rf $BLUE"
ssh -i $PEM $SERVER "mv $GREEN $BLUE && mv $TEMP $GREEN"
#ssh -i $PEM $SERVER "cd $GREEN && pm2 pnpm reload --character=./characters/matt_levaine.character.json --name 'matt_levaine' --update-env"