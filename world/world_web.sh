#!/usr/bin/env bash
cd /app/world_web
git pull
npm install
nohup npm run serve &
