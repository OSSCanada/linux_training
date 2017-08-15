#! /bin/bash

connectionString=$(az storage account show-connection-string -n rakaolinuxtraining -g linuxtraining --query 'connectionString' -o tsv) >> /dev/null

if [[ $connectionString == "" ]]; then  
    echo "Couldn't retrieve the connection string."
else
    az storage share create --name linuxtraining --quota 2048 --connection-string $connectionString 1>/dev/null
fi

echo $connectionString

# sudo mount -t cifs //rakaolinuxtraining.file.core.windows.net/linuxtraining [mount point] -o vers=3.0,username=rakaolinuxtraining,password=<account_key>,dir_mode=0777,file_mode=0777,sec=ntlmssp
