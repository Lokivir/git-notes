Shell commands
==============

### Useful commands:
```bash
info                    # shows the Info main menu
help                    # shows internally defined shell commands
<command> --help        # prints out the usage of a command and its arguments and options
man <command>           # opens the manual for the specified command
nano <file>             # opens the nano editor
echo "" > <file>        # creates a file with given text (overwrites files if it already exists)
echo "" >> <file>       # does the same, if the file already exists it adds the text not overwriting it
```

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

### Finding Things
```bash
grep <pattern> <path>                       # searches the pattern in the given path
grep -w <pattern> <path>                    # matches the pattern as exact word
grep -n <pattern> <path>                    # shows the lines, that contain the pattern
grep -i <pattern> <path>                    # makes the search case-sensitive
grep -v <pattern> <path>                    # inverts the search
grep -r <pattern> <path>                    # recursively searches through a set of files and subdirectories
grep -E <pattern> <path>                    # the pattern is an extended relugal expression i.e. "^.opt"
find <path> -type d                         # lists all directories in the given path and its subdirectories
find <path> -type f                         # same as above, but finds all files
find <path> -name "*.txt"                   # lists all files ending with .txt
find grep -n "opt" $(find . -name "*.md")   # finds all .md files in the given path and then searches for the pattern "opt"
```

# Sources
* https://www.ernstlx.com/linux90bash.html
* http://swcarpentry.github.io/shell-novice/02-filedir/index.html
* http://swcarpentry.github.io/shell-novice/07-find/index.html