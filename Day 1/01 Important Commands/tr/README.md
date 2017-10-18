# TR

The "translate" command can translate many different patterns of characters into new ones.

**NOTE**: ```tr``` requires stdout to be piped to it, or redirect a file as standard in (stdin).
- ```some_command | tr 'pattern1' 'pattern2'```
- ```tr 'pattern1' 'pattern2' < some_file.txt```

## Exercise

Please use the asset [sort_uniq.txt](../../../assets/sort_uniq.txt) file.

1. Squeeze all repeated lowercase letter 'L' from ```sort_uniq.txt```
2. Replace all "ho" with "qa" from ```sort_uniq.txt```
3. Change all lowercase characters to uppercase from ```sort_uniq.txt```
4. Save ouput from #4 to ```results.txt```

## Solutions
```bash
#1 Method 1 - exmaple of stdin redirection
tr -s "l" < sort_uniq.txt

#1 Method 2 - example of piping
cat sort_uniq.txt | tr -s "l"

#2
tr "ho" "qa" < sort_uniq.txt

#3
tr '[:lower:]' '[:upper:]' < sort_uniq.txt

#4 Method 1
cat sort_uniq.txt | tr '[:lower:]' '[:upper:]' > results.txt

#4 Method 2 - good example of IO Redirection of stdin and stdout
tr '[:lower:]' '[:upper:]' < sort_unique.txt > results.txt
```