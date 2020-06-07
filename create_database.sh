#!/bin/bash
while [[ $dbname == '' ]] || [[ $username == '' ]] || [[ $password == '' ]]
do
    read -p "Database: " dbname
    read -p "User: " username
    read -sp "Password: " password
done
    sudo -u postgres psql -c "CREATE DATABASE $dbname;"
    sudo -u postgres psql -c "CREATE USER $username WITH ENCRYPTED PASSWORD '$password';"
    sudo -u postgres psql -c "ALTER ROLE $username SET client_encoding TO 'utf8';"
    sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE mydb TO $username;"
