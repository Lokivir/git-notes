Shell commands
==============

### Directory tree navigation:
```bash
pwd                     # prints out the working directory
ls                      # lists the files and directories in the working directory
ls -l                   # adds creation time, file size, read/write-permissions, etc.
ls -a                   # shows hidden files and directories
ls -la                  # you can use multiple options together, like -la
ls <option> <path>      # lists files and directories in the given path
cd <path>               # change directroy to specified path
cd                      # if no path argument is given, it changes to users home directory
cd ..                   # changes to parent directory
cd home    or   cd ~    # change to users home directory
cd -                    # changes back to previous directory
touch <path>            # creates an empty file in the specified path (touch ./test.md)
```

### File and directory manipulation
```bash
mdkir <path>            # creates an empty directory
cp <path> <path>        # copies a file
cp -i <path> <path>     # asks for permission to overwrite
cp -R <path> <path>     # copies a directory
mv <path> <path>        # move file/directory
rm <path>               # premanently removes/deletes a file
rmdir <path>            # deletes empty directory
rm -r <path>            # recursively removes a directory with its files
rename <path>           # renames multiple files by the given pattern
ln -s <path> <link>     # creates a symbolic link
```

# Sources
* https://www.ernstlx.com/linux90bash.html