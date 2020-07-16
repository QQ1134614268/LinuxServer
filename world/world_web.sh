#!/usr/bin/env bash
cd /app/world_web
git reset --hard origin/master
npm install
nohup npm run serve &
