#!/bin/bash

# Create DB
./create-db.sh $1 $2

# Create schemas and inital data
cat ../design/names_schema_v2.4.sql ../data/categories-privileges.sql \
    ../data/sample-data-lnls-v2.4.sql | mysql -u root -p $1
