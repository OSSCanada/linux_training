# The Linux File System

Here we will learn how to do basic file creation, editing, copying and moving.

Key thing to note: Everything is a file.  Even processes running in Linux are essentially "just files".

## Commands
- ```touch``` creates a blank file 
    - e.g. ```touch test.txt```
- ```nano``` TUI (text based user interface) text editor.  Use this command to enter a basic text editor mode and update the contents of a file. 
    - e.g. "```nano test.txt```" will open up ```test.txt``` and allow you to do basic text editing.
- ```cp``` copies a file to a new location 
    - e.g. "```cp test.txt ../```" copies file ```test.txt``` to the parent directory.
- ```mv``` moves and/or renames a file 
    - e.g. "```mv test.txt test2.txt```" moves/renames file ```test.txt``` to ```test2.txt```
    - Moving and renaming a file are essentailly the same thing
- ```ln``` creates links.  There are two kinds
    - hard links point directly to an inode (an object that actually represents a file or folder in a file system)
    - soft links are created with ```-s``` flag, and are indirect (symbolic) links to inodes, by referencing another file, which is directly connected to the inode file reference
    - a picture speaks a thousand words ![hard and soft links](https://i.stack.imgur.com/ka2ab.jpg)

## Create or Append to a file
You can also pipe output directly to a file in two ways:
- ```>``` writes output directly to a file.  If the file exists, overwrite content with output, otherwise create the file.  e.g. ```echo "hello world" > test.txt```
- ```>>``` appends output directly to a file.  If the file exists, append output to file, otherwise create the file.  e.g. ```echo "hello world" >> test.txt```

These are actually forms of I/O redirection which we will describe later on.

Generally the safer option is to use the ```>>``` append utility as it does not overwrite content and is less destructive.

## Standard input, output, error and I/O redirection

### I/O Streams
Generally there are 3 streams in Linux:
- Standard in (stdin aka #0): generally the user's keyboard or other input (can also be a text file for some script automation)
- Standard out (stdout aka #1): generally output in terminal, or redirected to another source (i.e. access log file)
- Standard error (stderr aka #2): generally output in terminal, or redirected to another source (i.e. error log file)

### I/O Redirection
The ouputs/results of commands and bash scripts are generally ```stdout``` (```1```) and ```stderr``` (```2```).  They are symbolically referenced by the numbers 1 and 2 respectively.  By default the results are displayed in the user's terminal window.  You may also redirect this outpt to files (generally log files).  Many services will do this (e.g. Apache2 and MySQL will do this when the service is running and encounters updates/errors).

You can do this as well with your commands and bashs scripts by doing the following:
- ```echo "hello world" 1> file.txt``` this will redirect ```stdout``` aka ```1``` to the file ```file.txt```
    - the above is the same as ```echo "hello world" > file.txt```
- ```echo "hello world" 2>&1 > file.txt``` this will redirect both ```stderr``` aka ```2``` and ```stdout``` aka ```1``` to the file ```file.txt```  this is useful when you want to dump everything into one log file.
    - Note that you must add the ```&``` after the ```>``` as this tells the system that you mean to redirect to a stream (in our case ```1``` or ```stdout```) and not a file named (1).  Omitting the ```&``` will result in sending ```stderr``` to ```file.txt```.

### Special Redirection ```/dev/null```

- ```/dev/null``` is a special redirection - it dumps/ignores any results it gets.  Essentially it writes to nothing...so nothing from the generated output will be ever be displayed or saved.
- ```echo "hello world" > /dev/null``` will display nothing and will be saved to nothing.


## Exercise

Do the following:
1. Copy the ```output``` folder from the ```split``` exercise to this directory

# Solution

## Split

```bash
cp -r ../split/output .
```

### Description
- ```-r``` for folders with files, you want to use the recurssive flag that will copy all files in the listed folder
- ```../split/output``` tells the command to use the folder ```output```  in the previous directory (one level up) as the source directory
- ```.``` tells the command to use the current directory represented by ```.``` as the target directory (folder to copy to)