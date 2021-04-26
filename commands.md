# Git Commands
This is a little "documentary" for git commands on what they are, what they do and how to use them.

## git init
Creating an empty repository or reinitialize an existing one.
```
git init [-q | --quiet] [--bare] [--template=<template_directory>]
	  [--separate-git-dir <git dir>] [--object-format=<format>]
	  [-b <branch-name> | --initial-branch=<branch-name>]
	  [--shared[=<permissions>]] [directory]
```

example:
```
git init /home/user/git-notes
```

## git add
Updating the index for the next commit.
So by using the 'git add' command you can add new or modified files to the index, before commiting them.

By using 'git add .' you update the index including everything (new, modified and deleted files altogether).
```
git add [--verbose | -v] [--dry-run | -n] [--force | -f] [--interactive | -i] [--patch | -p]
	  [--edit | -e] [--[no-]all | --[no-]ignore-removal | [--update | -u]]
	  [--intent-to-add | -N] [--refresh] [--ignore-errors] [--ignore-missing] [--renormalize]
	  [--chmod=(+|-)x] [--pathspec-from-file=<file> [--pathspec-file-nul]]
	  [--] [<pathspec>�?]
```

example:
```
git add commands.md
git add .
```

## git commit


## git pull

## git push


# Source:
https://git-scm.com/docs/git-init
https://git-scm.com/docs/git-add
https://git-scm.com/docs/git-commit
https://git-scm.com/docs/git-pull
https://git-scm.com/docs/git-push