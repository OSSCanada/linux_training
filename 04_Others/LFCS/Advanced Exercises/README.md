# Advanced exercises

Most advanced scenarios will require you to chain the output of several commands together (also known as "piping").

## Removing all Docker Containers

### Method 1: ```cut``` + ```awk``` commands

```:bash
# list all docker containers active && inactive (aka stopped)
docker ps -a

# list only the docker container ID column in output
docker ps -a | cut -d" " -f 1

# list only the docker cotainer IDs (remove first row title "CONTAINER ID")
docker ps -a | cut -d" " -f 1 | awk -n '1!p'

# all together
# remove all active/inactive docker containers
docker rm $(docker ps -a | awk -n '1!p' | cut -d" " -f 1)
```


#### Description

- ```cut -d" " -f 1``` tells the ```cut``` command to use ```whitespace``` as the delimeter and to return only the first column of info for each row
- ```awk -n '1!p'``` tells the ```awk``` command to ignore the first row
- ```$(docker ps -a | awk -n '1!p' | cut -d" " -f 1)``` the ```$(...)``` runs/nests commands within other commands and outputs the final results to the calling 'parent' command.  In this example we run the code inside ```$(...)``` which returns all the docker container IDs (in a carriage return list) and outputs/injects those ids into the parent ```docker rm``` command which will remove each container ID in sequence.
- **Note** we are using the ```|``` pipe to chain the output from the previous command to the next command, thus fine tuning for our final output

### Method 2: using ```awk``` command only

```:bash
docker rm $(docker ps -a | awk 'NR > 1 { print $1 }')
```

#### Description 
- ```awk 'NR > 1 { print $1 }'``` this will tell the ```awk``` command to only applies to "rows greater than row 1" and then prints the output of "column 1" for each applicable row

## Remove all Docker Images

### Method 1: using ```tr```, ```cut``` and ```awk```
```:bash
# list all docker images on your local system
docker images

# Squeeze/reduce the number of repeated whitespace characters between columns in a row
# We must do this because the output is pretty/human formatted for presentation/readability
# The cut command will only recognize the first space/whitespace character if we use the -d" " flag
# examples:

# We're ok...gets us the first column no problem
docker images | cut -d" " -f 1

# doesn't work...since cut will delimit by single whitespace characters...-f 4 will return the 4th whitespace which is blank
docker images | cut -d" " -f 4

# let's transform the text and reduce/squeeze the repeated whitespace characters down to one
# the output will look kinda weird but we're ok...
docker images | tr -s ' '

# Now let's pipe to cut to get our 4th column for image IDs only...
docker images | tr -s ' ' | cut -d" " -f 4 | awk 'NR > 1 { print $1 }'

# all together
docker rmi $(docker images | tr -s ' ' | cut -d" " -f 4 | awk 'NR > 1 { print $1 }')
```

### Method 2: using ```awk``` command only

```:bash
docker rmi $(docker images | awk 'NR > 1 ${print $4}')
```