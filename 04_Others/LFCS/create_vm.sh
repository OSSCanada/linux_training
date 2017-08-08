#! /bin/bash

az group create -n lfcstest -l canadacentral

az group deployment create --name lfcsarmtest --template-file arm.template.json --resource-group lfcstest --no-wait