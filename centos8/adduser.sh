#!/usr/bin/env bash
adduser r_project
passwd r_project
whereis sudoers
ls -l /etc/sudoers
chmod -v u+w /etc/sudoers
vim /etc/sudoers
chmod -v u-w /etc/sudoers
