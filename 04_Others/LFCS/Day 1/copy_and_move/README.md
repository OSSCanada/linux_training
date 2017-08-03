# Exercise



Do the following:
1. Copy the ```output``` folder from the ```split``` exercise to this directory

# Solution

## Split

```:bash
cp -r ../split/output .
```

### Description
- ```-r``` for folders with files, you want to use the recurssive flag that will copy all files in the listed folder
- ```../split/output``` tells the command to use the folder ```output```  in the previous directory (one level up) as the source directory
- ```.``` tells the command to use the current directory represented by ```.``` as the target directory (folder to copy to)