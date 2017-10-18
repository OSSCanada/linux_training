# FMT

The ```fmt``` command allows you to quickly reformat text files which long run on rows into more compact readable lines.  In otherwords it will break long lines of text into new lines of text.  The default width is 75 columns of text, and you can modify this with the ```-w <value>``` flag where ```<value>``` is a numeric number representing the maximum column width.

Using [long_text_file.txt](../../../assets/long_text_file.txt) you can try the following exercises:

## Exercise 1
1. Format the file ```long_text_file.txt``` to something more readable with a width of 70 columns
2. Repeat #1 writing output to a new file
3. Replace the old file ```long_text_file.txt``` with the new file

## Solution 1
```bash
#1
fmt -w 70 long_text_file.txt

#2
fmt -w 70 long_text_file.txt > new_file.txt

#3
rm long_text_file.txt && mv new_file.txt long_text_file.txt
```