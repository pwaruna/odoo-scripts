#!/bin/bash
########################################################
# Script to synchronise custom addons in odoo
#
# Set custom addon directory and git repo to excute
#
# (C) Copyright Pranalanka Warunawansa. 2021
#
# Todo : Staging with git branches
#
########################################################

LOCAL_DIR="/odoo/custom/addons"
REPO="https://github.com/myrepo/my-custom-addons"

git -C $LOCAL_DIR pull || git clone $REPO $LOCAL_DIR
sudo chown -R odoo:odoo $LOCAL_DIR

sudo systemctl restart odoo-server
