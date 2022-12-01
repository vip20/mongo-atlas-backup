#!/bin/bash
BACKUP_DIR="backups"
  if [ ! -d ./$BACKUP_DIR/ ]; then
    mkdir $BACKUP_DIR
  fi
mongodump --host $INPUT_MONGODB_SERVER \
--ssl  --username $INPUT_MONGODB_USER --password $INPUT_MONGODB_PAS \
--authenticationDatabase admin --db  $INPUT_MONGODB_NAME -o=./$BACKUP_DIR

  echo "🔍 Show me backups... 😎"
  ls -lFhS ./$BACKUP_DIR/