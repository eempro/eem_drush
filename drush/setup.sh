#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Installing Drupal

echo -e "${BLUE}Installing Drupal:${NC}"
SITE_NAME="monkeytwo"
DESTINATION="/var/www"
mkdir -p ${DESTINATION}
drush dl "drupal-8.x" --destination="${DESTINATION}" --drupal-project-rename="${SITE_NAME}"

echo -e "${BLUE}Setting up the database:${NC}"
echo $MYSQL_USER

