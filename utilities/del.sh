#!/bin/bash

if [ $# -eq 0 ]
  then
    echo -e "Enter the Kafka Connect connector name to delete name\n\nExample:\ndel mongo-sink\n\n"
    exit 1
fi

curl -X DELETE connect:8083/connectors/$1