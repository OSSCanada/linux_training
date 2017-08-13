# The Linux File System

Here we will learn how to do basic file creation, editing, copying and moving.

## Commands
- ```touch``` creates a blank file e.g. ```touch test.txt```
- ```nano``` TUI (text based user interface) text editor.  Use this command to enter a basic text editor mode and update the contents of a file. e.g. "```nano test.txt```" will open up ```test.txt``` and allow you to do basic text editing.
- ```cp``` copies a file to a new location e.g. "```cp test.txt ../```" copies file ```test.txt``` to the parent directory.
- ```mv``` moves and/or renames a file "```mv test.txt test2.txt```" moves/renames file ```test.txt``` to ```test2.txt```.  Moving and renaming a file are essentailly the same thing.

## Create or Append to a file
You can also pipe output directly to a file in two ways:
- ```>``` writes output directly to a file.  If the file exists, overwrite content with output, otherwise create the file.  e.g. ```echo "hello world" > test.txt```
- ```>>``` appends output directly to a file.  If the file exists, append output to file, otherwise create the file.  e.g. ```echo "hello world" >> test.txt```

These are actually forms of I/O redirection which we will describe later on.

Generally the safer option is to use the ```>>``` append utility as it does not overwrite content and is less destructive.

## Standard input, output, error and I/O redirection
Generally there are 3 streams in Linux:
- Standard in (stdin aka #0): generally the user's keyboard or other input (can also be a text file)
- Standard out (stdout aka #1): generally output in terminal, or redirected to another source (i.e. log file)
- Standard error (stderr aka #2): generally 


## Exercise

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