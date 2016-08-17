#!/bin/bash

cat create-db.sql ../design/names_schema_v2.4.sql ../data/categories-privileges.sql \
    sample-data-lnls-v2.4.sql | mysql -u root -p discs_names
