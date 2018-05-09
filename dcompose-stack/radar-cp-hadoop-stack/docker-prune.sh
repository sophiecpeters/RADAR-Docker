#!/bin/bash

. ./util.sh
. ./.env

check_command_exists docker

echo "This will delete all the data associated with RADAR in HDFS, MongoDB and Postgres. This will also delete all data in docker containers. Do you wish to continue? yes or no."
select yn in "Yes" "No"; do
  case $yn in
    Yes ) sudo-linux docker system prune --filter "label!=certs" "$@";
          sudo-linux rm -rf "$HDFS_DATA_DIR_1";
          sudo-linux rm -rf "$HDFS_DATA_DIR_2";
          sudo-linux rm -rf "$HDFS_NAME_DIR_1";
          sudo-linux rm -rf "$HDFS_NAME_DIR_2";
          sudo-linux rm -rf "$MONGODB_DIR";
          sudo-linux rm -rf "$MP_POSTGRES_DIR";
          break;;
    No ) exit;;
  esac
done
