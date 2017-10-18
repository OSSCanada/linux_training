# Sort and Uniq

These examples will leverage both ```sort``` and ```uniq``` together as they usually work in tandem.

## Examples

Please use the asset [sort_uniq.txt](../../../assets/sort_uniq.txt) file.

1. Reduced the repeated lines in the document ```sort_uniq.txt```
2. Further reduce the repeated lines by sorting them first then filtering out repeated lines
3. Repeat step #2 but save output to a new file "unique_only.txt"


## Solutions
```bash
#1
uniq sort_uniq.txt

#2
sort sort_uniq.txt | uniq

#3
sort sort_uniq.txt | uniq > uniq_only.txt
```