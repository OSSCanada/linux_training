# Exercise

Copy 

Do the following:
1. Copy the ```output``` folder to this directory

# Solution

## Split

```:bash
cp -r ../split/output .
```

### Description
- ```-d``` adds a numberical suffix to the filename (before the file extension) (default is alphabetical)
- ```-a 3``` makes the filename suffix 3 characters long
- ```-l 10``` makes each new file a maximum of 10 lines long
- ```--additional-suffix=.txt``` adds the ```*.txt``` file extention to the filename
- ```source.txt``` is the source file
- ```new``` is the basename for the target/desitination files

This should produce many files with filenames newxxx.txt where xxx is an ascending value starting from 000 to the total number of files it takes to split ```source.txt``` into files with 10 lines of text maximum in them.  In our example it should be ```new000.txt``` to ```new999.txt``` since there are 10,000 lines in ```source.txt``` (10,000 lines/10 lines per file = 1000 files).