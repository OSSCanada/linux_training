# Split


## Exercise
The file [split.txt](../../../assets/split.txt) contains 10,000 lines of text.

Do the following:
1. Create directory named ```output```
2. Split the file ```split.txt``` into multiple files that contain at **most** 10 lines of text each
3. Ensure that each file is named ```nameXXX```, where ```XXX``` is an ascending numerical value at least 3 numbers in length
4. Ensure that the file extension is ```.txt```
5. Example filename: ```name980.txt```


## Solution
```bash

mkdir output

split -l 10 -a 3 -d --additional-suffix=.txt split.txt output/new
```

### Description
- ```-l 10``` makes each new file a maximum of 10 lines long
- ```-a 3``` makes the filename suffix 3 characters long
- ```-d``` adds a numberical suffix to the filename (before the file extension) (default is alphabetical)
- ```--additional-suffix=.txt``` adds the ```*.txt``` file extention to the filename
- ```split.txt``` is the source file
- ```new``` is the basename for the target/desitination files

This should produce many files with filenames newxxx.txt where xxx is an ascending value starting from 000 to the total number of files it takes to split ```split.txt``` into files with 10 lines of text maximum in them.  In our example it should be ```new000.txt``` to ```new999.txt``` since there are 10,000 lines in ```split.txt``` (10,000 lines/10 lines per file = 1000 files).