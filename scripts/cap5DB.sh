#!/usr/bin/env bash
DB=$1;
DUMPFILE=$2;

#clean up first
echo "Droping database $DB if it already exists.";
mysql -uhomestead -psecret -e "DROP DATABASE IF EXISTS $DB";

echo "Creating new database $DB";
mysql -uhomestead -psecret -e "create database $DB";

echo "Importing data to $DB from $DUMPFILE";
mysql -u martsund -p secret -h localhost -e "$DB < $DUMPFILE";