#!/bin/shell
# This script will create a database, an user with all privilieges

service mysql start

# Functions (in green)
ok() { echo -e '\e[32m'$1'\e[m'; }

EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`

Q1="CREATE DATABASE IF NOT EXISTS $1;"
Q2="CREATE USER '$2'@'localhost';"
Q3="SET password FOR '$2'@'localhost' = password('$3');"
Q4="GRANT ALL ON *.* TO '$2'@'localhost' IDENTIFIED BY '$3';"
Q5="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}${Q4}${Q5}"

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 db_name db_user db_pwd"
  exit $E_BADARGS
fi

$MYSQL -uroot -p -e "$SQL"

ok "Database $1 and user $2 created with a password $3"
