# Basic Commands

These are the most common and "basic" commands.  This is deceiving as most commands have some advanced functionality...just not commonly used.  They become very powerful when you chain or "pipe" them together to refine or filter your ouput to get specific results.  The refinement of results can be used to automate processes via other commands in the chain/pipe.  We will see this in all our examples.

## Displaying text
- ```cat``` short for "concatenate", this command outputs the text within a given file
    - e.g. ```cat /etc/passwd``` will output the ```passwd``` file, which is a text based database taht defines information about a user (login shell, home directory etc.).  More on the ```passwd`` file in User Management section of "Day 2" exercises.
- ```head``` displays the first 10 lines (by default) of a file or piped output.
    - e.g. ```head /etc/passwd``` will output/return only the first 10 rows (lines) of the file ```passwd```
    - change the default number of lines to output/return using the ```-n``` switch
- ```tail``` the opposite of the ```head``` command, it displays the last 10 lines (by default) of a file or piped output.
    - e.g. ```tail /etc/passwd``` will ouput/return ojnly the last 10 rows (line) of the file ```passwd```
    - change the default number of lines to output/return using the ```-n``` switch
- ```more``` allows you to view a long file/output one page at a time - fairly limited...should use ```less``` command instead...you'll see why
- ```less``` confusingly named...has additional functionality than the ```more``` command
    - can page forward && backward in a document. (```more``` can only page forward)
    - can serach for text using the same patterns as ```Vim``` does; "```/<pattern>```"

## Filters
- ```grep``` search for patterns within files or a piped stream
    - ```grep "some pattern" file.txt```
    - ```ls | grep "some pattern"```
- ```find``` allows you to find files of a certain type (files, directories, etc), size (bytes, kilobytes, megabytes, gigabytes) and other attributes
    - Example: ```find -type f -size +83c -name "*.txt"``` find files of size greater than 83 bytes with file extension of "*.txt"
- ```cut``` allows you to parse through each line of a file and remove specific parts.  Best used for deliminated files (CSVs, TSVs, tables, etc).
    - Example: ```cut -d: -f1 /etc/passwd``` this will parse through the important ```/etc/passwd``` file, using the ```:``` as the delimeter and return only the first column/field (the username).
- ```sort``` allows you to sort lines of text files
    - Example: ```sort some_file.txt``` will output the file sorted in alphanumeric order
    - Use ```>>``` to append the output to a file and save the results or use the ```-o``` or ```--output``` flags to choose a file to write results to
- ```uniq``` allows you to remove or display repeated lines in a file and return the output. **NOTE** *only if* they are listed consecutively (in order) - works well when used with sort to order repeated groups together
    - Example: ```uniq some_file.txt``` will output the contents of the file, after reducing the consecutivly repeated lines within the document
- ```fmt``` formats lines (columns) of text into a specified width (75 columns by default)
    - excellent for text files with one long run on line (zero to few line breaks)
    - more human readable format with line breaks
    - Example: ```fmt long_text_file.txt``` will ouput new text with line breaks and lines that are no more than 75 columns wide
        - you will need to pipe/append the output to a new file or overwrite the existing file
- ```wc``` short for word count - this command also counts the number of newline, bytes, characters and...of course words
    - Example: ```wc -w some_file.txt``` counts the number of words (only) in a file
    - by default will output a whitespace separated count of (words) (lines) (bytes) (filename)
- ```ls``` lists the directory contents (equivalent to ```dir``` in Windows)
    - Example: ```ls -la``` lists current directory's contents in "long form" (```-l```) including hidden files (```a```)
- ```diff``` compares two files line by line and show where they differ
    - Best to use with ```-y``` flag for better readability and potentially
    - Use ```-W``` to set the column width of the output
    - Example: ```diff -y -W 20 file1.txt file2.txt``` will create an ouput with 3 columns
        - column 1 displays the output of ```file1.txt```
        - column 2 displays the difference (```|``` means a difference, ```>``` or ```<``` indicates a line missing from one file or the other)
        - column 3 displays the output of ```file2.txt```

## Editing text
- ```sed``` short for "stream editor" is capable of modifying/replacing strings in a stream of content
    - Example: ```sed "s/hello/goodbye/g" some_file.txt```
- ```tr``` transforms or "translates" characters from a stream of text
    - Example: ```tr -s " " < some_file.txt``` will squeeze (translate) all instances of repeated whitespace into a single instance.  Good for multi-tab/space separated files
    - Example: ```tr '[:lower:]' '[:upper:]' < some_file.txt``` this will change all lowercase letters to uppercase
    - Example: ```tr 'abcd' 'wxyz` < some_file.txt``` this will map and change all occurences of ```a``` to ```w```, ```b``` to ```x```, etc.
- ```split``` can divide a single large file into multiple files based on file size, total number of files, or number of lines per new file etc.
    - Example: ```split -l 10 source_file.txt results``` this will split the file ```source_file.txt``` into multiple files, each with at most 10 lines of text and will be named resultsXX where XX is an alphabetical ascending letter for each new file.  There will be no file extension.

## Advanced commands
- ```awk``` is both a command and a scripting language in it's own right.  Within an ```awk``` command you can add conditionals and other constructs to quickly filter for precise results.  This is a very advanced tool and can be used in place of many of the above commands, though piping/chaining these commands are some times simpler in concept than a single ```awk``` command.

## Piping/Chaining commands
You can chian or pipe commands to refine or accomplish different tasks.  This is accomplisehd by using the pipe ```|```.
- Example: ```cat some_file.txt | grep "Hello World"``` will pipe the output of ```cat``` to the ```grep``` command and filter for only the phrase "hello world"
    - this is a contrived example because ```grep``` can do this on ```some_file.txt``` directly, but shows that you are piping the output to ```grep``` (note that you're not telling ```grep``` what file to search through, but are using an ouput stream instead).

You can also use the ```tee``` command in much the same way, but you would write to a file while also passing the output on to the next chain simultaneously.
    - ```ls | tee results.txt | grep "filename"``` this will send the output of ```ls``` command to ```tee``` which will then create the file ```results.txt``` which stores the output of ```ls``` into a new file, and simultaneously sends the output from ```ls``` to ```grep```.  Think of it like plumbing code with a "T" joint.

## Command subsitution
You can also do command subsitution or essentially an interpolation of one command inside another.
- Example: ```grep "some phrase" $(find -type f -size +83c)``` this will search for "some phrase" only in files found that are larger than 83 bytes.

## Command History

Should you ever need to see what commands have been run during your current session (and some of previous session) you can use the ```history``` command.  This is helpful when you wish to remember a previously run command.  When using the ```up/down``` arrows on your keyboard, you are navigating through the history command, starting with the most recent command.  You can also search through this command by piping it to ```grep``` to search for parts your can recall.