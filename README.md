# Linux Training

![MS Loves Linux](images/ms_loves_linux.png)

This training is meant to be a hands on study guide to learn linux administration in general, but with the context of Microsoft Azure in mind.  It is also designed for a Ubuntu Server environment.

## Setup

Run the following commands to setup the Azure environment required to run the exercises.

You will need to have an Azure account.  In our setup scripts we will be deploying ```DS2_V2``` VMs running Ubuntu 14.04.5.

You may deploy what you would like, just ensure you meet the below requirements.

## Requirements
- A Virtual Machine with Ubuntu 14.04 or newer installed
- One of Azure File Storage, NFS or SMB file share
- 4 attached disk drives

## Setting up environment with Azure

Alternatively you may deploy all the required services as a few commands with Azure and Azure-CLI.

You can find instructions to install Azure-CLI [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

This template will deploy an Azure VM of size ```D2_V2``` and attach 4 additional disk drives (we will use these for creating disk partitions, managing RAID configuration, formatting drives, backup/restore and other exercises).

The Azure template also creates the following default admin account (line 115 and 116 of ```scripts/ARM/arm.template.json```):
- Default username: ```linuxadmin```
- Default password: ```@dminpassw0rd!```

```bash
# Update Azure-CLI
az component update

# login to your Azure account
az login

# list your subscriptions (you will need to choose one in a moment)
az account list

# set the subscription to deploy services into
az account set --subscription <subscription-id>

# create a new Azure resource group to deploy servces into
az group create --name <resource_group_name> -l <azure_datacentre_location>

# example
az group create --name linuxtraining -l canadacentral

# deploy the included azure template (scpits/ARM/arm.template.json)
az group deployment create --name lfcsarmtest --template-file scripts/ARM/arm.template.json --resource-group linuxtraining --no-wait

## Alternatively run the deploy script from this repository directly
az group deployment create --name lfcsarmtest --template-uri https://raw.githubusercontent.com/OSSCanada/linux_training/master/scripts/ARM/arm.template.json --resource-group linuxtraining --no-wait

# or deploy straight from github
az group deployment create --name lfcsarmtest --template-uri https://raw.githubusercontent.com/raykao/azure_workshops/master/04_Others/Linux_training/scripts/ARM/arm.template.json --resource-group linuxtraining --no-wait

```
