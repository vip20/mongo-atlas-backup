#!/bin/bash
mongodump --host $INPUT_MONGODB_SERVER \
--ssl  --username $INPUT_MONGODB_USER --password $INPUT_MONGODB_PAS \
--authenticationDatabase admin --db  $INPUT_MONGODB_NAME --gzip --archive >  dump_`date "+%Y-%m-%d"`.gz
