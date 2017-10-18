# Exercises

## Description

The ```tar``` command ("tape archive") is used mostly for file archiving.  It has the ability to compress files and folders as well and includes multiple compression algorithums (gzip, bzip2, xz etc.).

## Exercise 1

Do the following:
1. Create a tar archive of the assets folder

## Exercise 2

Do the following:
1. Create a tar archive and compress it using the bzip2 algorithum in one command
2. Create a new directory in your home directory
3. Copy archive to new directory
4. Extract/decompress archive in new directory

## Exercise 3
1. go to the ```assets/output``` folder created in the split exercises
2. find only the files with the the number 3 as the last suffix 'newxx3.txt`
3. Add them to a gzip archive
4. Copy the new gzip archive to your ```backups``` folder
5. Expand/Decompress the folder to your ```backups``` folder

# Solutions

## Solution 1

```bash
tar -cvf archive.tar assets
```

### Description

This solution creates a tar archive file ```archive.tar```

- ```c``` tells tar command to create an archive
- ```v``` tells tar to be verbose with it's output
- ```f``` tells tar to archive everything into a single archive file
- ```archive.tar``` this is the target/destination file to create
- ```output``` the source folder to archive

## Solution 2

```bash
#1 - Method 1 - explicitly define compression type (j = bzip2, J = xz, z = gzip)
tar -cjvf archive.tar.bz assets

#1 - Method 2 - implicitly/automatically define compressesion type based on target file type (*.bz = bzip2, *.xz, *.gzip = gzip)
tar -cavf archive.tar.bz assets

#2
mkdir ~/backups

#3
cp archive.tar.bz ~/backups

#4
cd ~/backups
tar -xvf archive.tar
```

## Solution 3
```bash
ls *3.txt | xargs tar -cavf archive.tar.gz 
cp archive.tar.gz ~/backups
cd ~/backups
tar -xvf archive.tar.gz
```

### Description

This solution creates an archive and compresses it in one step.  Here we are using the ```*.bz``` (aka bzip) file format for compression.

We have two methods:
- First one: explicitly chooses the bzip compression type (```j``` flag)
- Second one: implicitly/automatically chooses the bzip compression type based on file extension of the output file name (```*.bz```)

**Note**:

Notice that the compression type is the ***second*** flag/parameter in each example!!! (bzip2 = ```j```, automatic = ```a```)

#### Method 1

- ```c``` tells tar command to create an archive
- ```j``` tells tar to use the ```bzip2``` compression algorithum
- ```v``` tells tar to be verbose with it's output
- ```f``` tells tar to archive everything into a single archive file
- ```archive.tar.bz``` the output filename with filename extensions.  **Note**: that the command with ***current*** flags/parameters does not determine the compression/filetype based on the file extentions in the name (Method 2 does)
- ```output``` the source folder to archive

#### Method 2

- ```c``` tells tar command to create an archive
- ```a``` tells tar to automatically determine the compression algorithum type based on filename extention (```*.bz```)
- ```v``` tells tar to be verbose with it's output
- ```f``` tells tar to archive everything into a single archive file
- ```archive.tar.bz``` the output filename with filename extensions.  **Note**: that the command with ***current*** flags/parameters determines the compression/filetype based on the file extentions in the name (```*.bz```)
- ```output``` the source folder to archive