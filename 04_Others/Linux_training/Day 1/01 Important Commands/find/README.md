# Find

## Exercises

Go to the ```assets``` directory at the top level of this repo.  There are multiple text files there

1. Find all files in current directory with extension ```*.txt```
2. Do the same but only one folder (current folder) deep
3. Find files that are larger than ```70 bytes``` and have the file extensiion ```*.txt```
4. Remove leading ```./``` from results
5. execute a move command of all files from results to ```/some/folder/path```

## Solutions

1. ```find -type f -name "*.txt"```
2. ```find -maxdepth 1 -type f -name "*.txt"```
3. ```find -type f -size +70c -name "*.txt"```
4. There are at least two ways:
    - ```find * -type f -size +70c -name "*.txt"```
    - ```find -type f -size +70c -name "*.txt" | sed "s|./||"```
5. ```find * -type f -size +70c -name "*.txt" -exec mv {} /some/folder/path \;```