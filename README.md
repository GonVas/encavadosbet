# Encavados Bet
Bet on the encavados and win prizes.
## Usage

Requires:
 >Python3
 >Bottle
 
# Server commands

sudo iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-port 8080
\* \* \* \* \* /home/ubuntu/cronjob.sh
sudo /etc/init.d/cron status
# cronjob.sh

\#!/bin/sh

cd /home/ubuntu/encavadosbet/
git remote update
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull origin master
    pgrep python3 | xargs kill
    python3 encavadosbet.py
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
