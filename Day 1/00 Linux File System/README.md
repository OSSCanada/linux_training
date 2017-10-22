# The Linux File System

This is a primer on how the Linux filesystem works, and the most basic of commands that will allow you to navigate and perform basic file manimpulation.  We will learn the basics of file creation, editing, copying and moving.

Key thing to note in Linux: Virtually everything is a file.  Even processes running in Linux are essentially "just files".

See also:
    - [01 Important Commands](../01_importatnt_commands)
    - [03 File System Structure](../03_file_system_structure)

## Commands
- ```touch``` creates a blank file 
    - e.g. ```touch test.txt```
- ```nano``` TUI (text based user interface) text editor.  Use this command to enter a basic text editor mode and update the contents of a file. 
    - e.g. "```nano test.txt```" will open up ```test.txt``` and allow you to do basic text editing.
- ```cp``` copies a file/folder to a new location 
    - e.g. "```cp test.txt ../```" copies file ```test.txt``` to the parent directory.
    - to move a directory inlcude the ```-r``` flag to the command e.g. ```cp -r some_directory /path/to/new/directory```
- ```mv``` moves and/or renames a file/folder
    - e.g. "```mv test.txt test2.txt```" moves/renames file ```test.txt``` to ```test2.txt```
    - Moving and renaming a file are essentailly the same thing
- ```ln``` creates links.  There are two kinds
    - hard links point directly to an inode (an object that actually represents a file or folder in a file system)
    - soft links are created with ```-s``` flag, and are indirect (symbolic) links to inodes, by referencing another file, which is directly connected to the inode file 
    reference
        - e.g. ```ln -s /path/to/source/file /path/to/destination/folder```
        - Links will display differently when you use ```ls``` comnmand to display a folder's content
            - you will see where the file is attempt to link to
    - a picture speaks a thousand words ![hard and soft links](https://i.stack.imgur.com/ka2ab.jpg)
- ```cd``` stands for Change Directory - same comand as in Windows to move around in the file system
- ```ls``` list folder contents - similar to ```dir``` in the windows world, outputs the contents of the directory, with names only by default
    - ```ls -la``` lists all files with details, even hidden files
        - ```ll``` is an alias/short form of this command (they do the same thing)
- ```mkdir``` make directory - allows you to create a new directory
    - ```mkdir -p /some/folder/path``` allows you to create folders in the full path, even the ones that do not yet exist
- ``rm`` remove command - removes files or folders (with the ```-r``` flag)
    - **NOTE:** this command should only be used if you are CERTAIN of removing a file!!! **THERE IS NO UNDO** remove
    - **Safety tip:** if you're new to navigating the file structure...best to change directory to the target folder and then remove the file/folder

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

## Exercises
1. Navigate to your home directory
2. in your home directory create a new empty file nameed "test_file1.txt"
3. In your home directory, create a few folder at "~/temp/files/text" and all necesary folders along that path that do not exist yet
4. Copy "test_file1.txt" to "~/temp/files/text"
5. Delete the original "test_file1.txt"
6. Rename the copied "test_file1.txt" to "test_file1.txt.bak"
7. Add the text "Hello I'm a copy" to the text file
    - You can use nano/vim or append text to the file...up to you
8. Make a link to this file in your home directory