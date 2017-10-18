# AWK

```awk``` is an uber powerful command with it's own scripting langugae/syntax.

The command typically knows how to parse a file and separate out columns of data automatically (knows what delimiter to use).

Here we will only cover the most basic uses of it to create and parse output of log files - every Linux admin's dream.

## Basic Format

```awk``` leverages **regex** for pattern recognition inside two "```/```".  **regex** is its own topic and won't be covered in depth here.  If you're going to maximize the power of ```awk``` command - learn **regex**.

```bash
# regex
awk '/pattern/ { $action }'

# without regex - e.g. comparisson
awk '$3 == "Ray" { $action }'
```

## Examples

Please use [file.tsv](../../../assets/file.tsv)

1. List the current directory and pipe the results to ```awk``` and print entire output.
2. List the current directory and pipe the results to ```awk``` and only print column 7 of output.
3. List the current directory and pipe the results to ```awk``` and only print entire line if column 3 is equal to your username.
4. List the current directory and pipe the results to ```awk``` and only print entire line if the line contains a 0.

## Solutions

```bash
#1 Method 1
ls -la | awk '{ print }'

#1 Method 2
ls -la | awk '{ print $0}'

#2
ls -la | awk '{ print $7 }'

#3
ls -la | awk '$3 == "username" { print }'

#4
ls -la | awk '/[0]/ { print }'
```

## Links
- [https://www.tecmint.com/read-awk-input-from-stdin-in-linux/](https://www.tecmint.com/read-awk-input-from-stdin-in-linux/)
- [How to Use Awk and Regular Expressions to Filter Text or String in Files](https://www.tecmint.com/use-linux-awk-command-to-filter-text-string-in-files/)