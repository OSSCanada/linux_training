# Exercise

The file ```source.txt``` contains 10,000 lines of text.

Do the following:
1. Split the file ```source.txt``` into multiple files that contain at **most** 10 lines of text each
2. Ensure that the new files are saved to a directory named ```output```
3. Ensure that each file is named ```nameXXX```, where ```XXX``` is an ascending numerical value 
4. Ensure that the file extension is ```.txt```
5. Example filename: ```name980.txt```


# Solution

## Split

```:bash
split -d -a 3 -l 10 --additional-suffix=.txt output/source.txt new
```

### Description
- ```-d``` adds a numberical suffix to the filename (before the file extension) (default is alphabetical)
- ```-a 3``` makes the filename suffix 3 characters long
- ```-l 10``` makes each new file a maximum of 10 lines long
- ```--additional-suffix=.txt``` adds the ```*.txt``` file extention to the filename
- ```source.txt``` is the source file
- ```new``` is the basename for the target/desitination files

This should produce many files with filenames newxxx.txt where xxx is an ascending value starting from 000 to the total number of files it takes to split ```source.txt``` into files with 10 lines of text maximum in them.  In our example it should be ```new000.txt``` to ```new999.txt``` since there are 10,000 lines in ```source.txt``` (10,000 lines/10 lines per file = 1000 files).