# SED

Stream editor is a powerful command.  In most of our examples we will use it to substitute text from a document or a standard output stream.

**Note**: by default ```sed``` only outputs to the terminal and does not write to a file.  This means you will have to deliberatley create or overwrite an exisitng file.

## Exercise

Using the file [split.txt](../../../assets/split.txt):

1. Find and substitute the word "hoodie" with "developer uniform"
2. Do #1 but now write it to a new file
3. Do #2 but replace the original file

## Solution

```bash
#1
sed "s/hoodie/developer uniform/" split.txt

#2
sed "s/hoodie/developer uniform/" split.txt > new_file.txt

#3 - Method 1
sed "s/hoodie/developer uniform/" split.txt > new_file.txt
mv split.txt split.txt.bak
mv new_file.txt split.txt

#3 - Method 2
sed -i.bak "s/hoodie/developer uniform/" split.txt
```