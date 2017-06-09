# Using Docker Machine on Azure

In this workshop we'll run through what the ```docker-machine``` command line tool is and how to use it to deploy a VM in Azure and then auto install docker into that VM.

## Requirements
- Docker for [Mac](https://download.docker.com/mac/stable/Docker.dmg) or [Windows](https://download.docker.com/win/stable/InstallDocker.msi) installed (includes ```docker```, ```docker-machine``` and ```docker-compose``` commands)
- (Optional) [Azure-CLI](https://azure.github.io/projects/clis/) to view/create/modify Azure Resources.

## What is ```docker-machine```

Docker provides various command line tools.  The ```docker``` command is the most utilized one, and is the one to deploy containers to your target docker host environment.  You can consider ```docker-machine``` a docker vm provisioning tool.  It helps you to provision a VM and install docker onto it.  You can remote to that VM using ```docker-machine ssh <vm_name>``` command for any additional administrative tasks you may need to do.  See [below](#basic-commands) for additional commands.

## Basic commands

### Create VM and install Docker
```:bash
docker-machine create \
    --driver azure \
    --azure-subscription-id <azure_subscription_id> \
    --azure-image <azure_image> \
    --azure-vm-size <azure_vm_size> \
    --azure-resource-group <azure_resource_group> \
    --azure-location <azure_datacentre_location> \
    <new_vm_name>
```

#### Parameter flags explained
- ```-d``` specifies the provider driver to use (Azure in our case)
-  ```--azure-subscription-id``` specifiy the azure subscription/account id you wish to deploy to (you may have multiple billing subscription/accounts associated to you)
- ```--azure-image``` specifiy the type of OS Image you wish to deploy.  Follows the same naming format ("Urn" format) as Azure-CLI/ARM template e.g. ```"Canonical:UbuntuServer:16.04-LTS:latest"```
- ```--azure-vm-size``` specify the size of the VM you wish to deploy including quotes.  Follows the same naming format as Azure-CLI/ARM template e.g. ```"Standard_D1_v2"```
- ```--azure-resource-group``` **OPTIONALLY** specify the azure resource group to deploy your VM to.  This vm can be an existing one or a new one.  If left out, defaults to ```"docker-machine"``` as the resource group to deploy or create.
- ```--azure-location``` specifiy the Azure datacentre location to deploy to e.g. ```"canadacentral"```
- ```<vm_name>``` specify the name of the new VM to be deployed.  This will be used as the name to connect to the vm and the VM's hostname. 

### List all created docker-machine VMs
```:bash
docker-machine ls
```

### Connect (SSH) to new VM
```:bash
docker-machine ssh <vm_name>
```

The ```docker-machine``` command creates and saves a new ```ssh-key``` pair for each new VM you create via the command.  This helps to not pollute/expose any other keys you may have and keeps it organized.

### Use your VM as the default target of the ```docker``` command
```:bash
eval $(docker-machine env <vm_name>)
```

This will export the required environment variables into your current shell session that the ```docker``` command needs to connect to the remote VM.  To see the output simply run the command without the "```eval $()```" i.e. ```docker-machine env <vm_name>```.

# Other resources

- Blog Post [ORCHESTRATING DOCKER WITH MACHINE, SWARM AND COMPOSE](https://blog.docker.com/2015/02/orchestrating-docker-with-machine-swarm-and-compose/) by [Ben Firshman](https://twitter.com/bfirsh)
