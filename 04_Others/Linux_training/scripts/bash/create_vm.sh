#! /bin/bash

az group create -n linuxtraining -l canadacentral

az group deployment create --name lfcsarmtest --template-uri https://raw.githubusercontent.com/raykao/azure_workshops/master/04_Others/Linux_training/scripts/ARM/arm.template.json --resource-group linuxtraining --no-wait
# az group deployment create --name lfcsarmtest --template-file ../ARM/arm.template.json --resource-group linuxtraining --no-wait