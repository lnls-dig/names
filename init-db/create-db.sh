#!/bin/bash

#========================================================
#Creating database :
#========================================================

# from: http://www.bluepiccadilly.com/2011/12/creating-mysql-database-and-user-command-line-and-bash-script-automate-process

EXPECTED_ARGS=2
E_BADARGS=65
MYSQL=`which mysql`

Q1="CREATE DATABASE IF NOT EXISTS $1;"
Q2="GRANT USAGE ON *.* TO $2@'%';"
Q3="GRANT ALL PRIVILEGES ON $1.* TO $2@'%';"
Q4="FLUSH PRIVILEGES;"
COMMAND="${Q1}${Q2}${Q3}${Q4}"

if [ $# -ne $EXPECTED_ARGS ]
then
echo -e "\nUsage: $0 dbname dbuser\n"
exit $E_BADARGS
fi

$MYSQL -uroot -p -e "$COMMAND"
