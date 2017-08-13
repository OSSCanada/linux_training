# Exercises

## Description

The ```tar``` command ("tape archive") is used mostly for file archiving.  It has the ability to compress files and folders as well and includes multiple compression algorithums (gzip, bzip2, xz etc.).

## For all exercises
1. Copy the ```output``` folder from the split exercise to this directory

```bash
cp -r ../split/output .
```

## Exercise #1

Do the following:
1. Create a tar archive

## Exercise #2

Do the following:
1. Create a tar archive and compress it using the bzip2 algorithum in one command

# Solutions

## Solution #1

```bash
tar -cvf archive.tar output
```

### Description

This solution creates a tar archive file ```archive.tar```

- ```c``` tells tar command to create an archive
- ```v``` tells tar to be verbose with it's output
- ```f``` tells tar to archive everything into a single archive file
- ```archive.tar``` this is the target/destination file to create
- ```output``` the source folder to archive

## Solution #2

```bash
# Multiple methods

## Method 1 - explicitly define compression type (j = bzip2, J = xz, z = gzip)

tar -cjvf archive.tar.bz output

## Method 2 - implicitly/automatically define compressesion type based on target file type (*.bz = bzip2, *.xz, *.gzip = gzip)

tar -cavf archive.tar.bz output
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