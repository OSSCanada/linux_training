# grep

## Exercises

1. Find the word "example" in the grep.txt file
2. Search for the word "example" in all "*.txt" files
3. List the contents of the current directory (```ls -la```)  and find any instances of the word "long" as part of the directory output
4. Run #2 again but have it output the number of lines that "example" appears in each file (hint: this is a flag/parameter to grep)
5. Run #4 again but make it a case insensitive search

## Solutions

```bash
# 1 - Method 1
grep "example" grep.txt

#1 - Method 2
cat grep.txt | grep "example"

#2
grep "example" *.txt

#3
ls -la | grep "long"

#4
grep -c "example" *.txt

#5
grep -ic "example" *.txt
```