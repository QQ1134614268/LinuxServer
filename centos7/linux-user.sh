#!/usr/bin/env bash
groupadd  world_group
useradd   world_user -g world_group
echo 'world_user' | passwd es_user --stdin
su world_user
userdel -r world
#usermod 选项 用户名
#/etc/passwd /etc/group
