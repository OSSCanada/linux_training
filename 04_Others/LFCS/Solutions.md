# Solutions

This solutions file acts as a consolidated file for each exercise's results with a guided explanation.

## Split

```:bash
split -d -a 3 -l 10 --additional-suffix=.txt split.txt new
```

### Description
- ```-d``` adds a numberical suffix to the filename (before the file extension) (default is alphabetical)
- ```-a 3``` makes the filename suffix 3 characters long
- ```-l 10``` makes each new file a maximum of 10 lines long
- ```--additional-suffix=.txt``` adds the ```*.txt``` file extention to the filename
- ```split.txt``` is the source file
- ```new``` is the basename for the target/desitination files

This should produce many files with filenames newxxx.txt where xxx is an ascending value starting from 000 to the total number of files it takes to split ```split.txt``` into files with 10 lines of text maximum in them.  In our example it should be ```new000.txt``` to ```new999.txt``` since there are 10,000 lines in split.txt (10,000 lines/10 lines per file = 1000 files).