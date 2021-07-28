#################################################
#!/bin/bash

# vars
BACKUP_DIR=backups
ODOO_DATABASE=TestDB
ADMIN_PASSWORD=adminpassword

# create a backup directory
mkdir -p ${BACKUP_DIR}

# create a backup
curl -X POST -F "master_pwd=${ADMIN_PASSWORD}" -F "name=${ODOO_DATABASE}" -F "backup_format=zip" -o 
${BACKUP_DIR}/${ODOO_DATABASE}.$(date +%F).zip http://odoo.example.org:8069/web/database/backup

# Copying to NAS via ncftp
#ncftpput -u username -p password hostname /folder backups/*.*

# Delete old backups on NAS
# Todo

# Delete lcal backups
#rm backups/*.*

# delete old backups
#find ${BACKUP_DIR} -type f -mtime +8 -name "${ODOO_DATABASE}.*.zip" -delete
