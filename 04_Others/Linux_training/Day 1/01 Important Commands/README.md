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
- ```grep```
- ```find```
- ```cut```
- ```uniq```
- ```wc```
- ```ls```

## Editing text
- ```sed```
- ```tr```
- ```split```

## Advanced commands
- ```awk```