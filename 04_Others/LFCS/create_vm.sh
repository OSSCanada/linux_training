#! /bin/bash

az group create -n lfcstest -l canadacentral

az group deployment create --name lfcsarmtest --template-file arm.template.json --resource-group lfcstest --no-wait

az storage account show-connection-string -n rakaolfcs -g lfcstest --query 'connectionString' -o tsv

az storage share create --name files --quota 2048 --connection-string "DefaultEndpointsProtocol=https;EndpointSuffix=core.windows.net;AccountName=<account_name>;AccountKey=<account_key>" 1>/dev/null

# sudo mount -t cifs //<storage_name>.file.core.windows.net/files [mount point] -o vers=3.0,username=<account_name>,password=<account_key>,dir_mode=0777,file_mode=0777,sec=ntlmssp
