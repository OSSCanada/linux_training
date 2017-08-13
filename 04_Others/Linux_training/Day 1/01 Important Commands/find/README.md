# Find

## Exercises

1. Find all files in current directory with extension *.txt
2. Do the same but only one folder (current folder) deep

## Solutions

1. ```find -type f -name "*.txt" ```
2. ```find -maxdepth 1 -type f -name "*.txt" ```