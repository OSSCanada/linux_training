# grep

## Exercises

1. Find ```*.txt``` files with the word "example" in them
2. Return only the filenames
3. Find only whole word
4. Find only whole word and case insensitive

## Solutions

1. ```grep "example" -name "*.txt"```
2. ```grep "example" -name "*.txt" | cut -d: -f1```
3. ```grep -w "example" -name "*.txt"```
4. ```grep -wi "example" -name "*.txt"```