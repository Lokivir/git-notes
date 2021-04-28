Git Commands
=============
This is a little "documentary" for git commands on what they are, what they do and how to use them.

## git init
`git init` creates an empty repository or reinitializes an existing one.

Running it in an existing repository is safe, because it won't overwrite anything that's already there.
You want to rerun  it, either to pick up added templates or to move it to another place (if `--separate-git-dir` is given).

### Synopsis
```
git init [-q | --quiet] [--bare] [--template=<template_directory>]
	  [--separate-git-dir <git dir>] [--object-format=<format>]
	  [-b <branch-name> | --initial-branch=<branch-name>]
	  [--shared[=<permissions>]] [directory]
```

### Examples
```
git init /home/user/git-notes/

or

cd /home/user/git-notes/
git init
```

## git add
`git add` updates the index for the next commit.
The index is the staging area between your working directory and your repository. 
So by using the 'git add' command you can add new or modified files to the index, before commiting them together.

>By using 'git add .' you update the index including everything (new, modified and deleted files altogether).

```
git add [--verbose | -v] [--dry-run | -n] [--force | -f] [--interactive | -i] [--patch | -p]
	  [--edit | -e] [--[no-]all | --[no-]ignore-removal | [--update | -u]]
	  [--intent-to-add | -N] [--refresh] [--ignore-errors] [--ignore-missing] [--renormalize]
	  [--chmod=(+|-)x] [--pathspec-from-file=<file> [--pathspec-file-nul]]
	  [--] [<pathspec>...]
```

examples:
|command				|execution																		|
|-----------------------|-------------------------------------------------------------------------------|
|`git add commands.md`	|adds *commands.md* to the index													|
|`git add .`			|adds all new and modified files from the **working directory**					|
|`git add --all`		|same as `git add .` but including the **whole** project						|

## git commit
`git commit` records the changes made to the repository by committing the current contents of the index and the given log message, to describe the changes made.

### Synopsis
```
git commit [-a | --interactive | --patch] [-s] [-v] [-u<mode>] [--amend]
	   [--dry-run] [(-c | -C | --fixup | --squash) <commit>]
	   [-F <file> | -m <msg>] [--reset-author] [--allow-empty]
	   [--allow-empty-message] [--no-verify] [-e] [--author=<author>]
	   [--date=<date>] [--cleanup=<mode>] [--[no-]status]
	   [-i | -o] [--pathspec-from-file=<file> [--pathspec-file-nul]]
	   [-S[<keyid>]] [--] [<pathspec>â€¦â€‹]
```
### Examples

```
git add commands.md
git commit -m "added commands.md"
```

## git pull
`git pull` fetches from a repository and integrates it with another repository or a local branch.


### Synopsis
```
git pull [<options>] [<repository> [<refspec>â€¦â€‹]]
```
### Examples
```
git pull (default parameter is 'origin')

git pull origin
```


## git push
`git push` updates the remote refs using the local ones.
### Synopsis
```
git push [--all | --mirror | --tags] [--follow-tags] [--atomic] [-n | --dry-run] [--receive-pack=<git-receive-pack>]
	   [--repo=<repository>] [-f | --force] [-d | --delete] [--prune] [-v | --verbose]
	   [-u | --set-upstream] [-o <string> | --push-option=<string>]
	   [--[no-]signed|--signed=(true|false|if-asked)]
	   [--force-with-lease[=<refname>[:<expect>]] [--force-if-includes]]
	   [--no-verify] [<repository> [<refspec>â€¦â€‹]]
```
### Examples
```
git push (default parameter is 'origin')

git push origin

git push <remote> (remote is the current branch's remote)
```

## git status
`git status` shows the working tree status and it's changes or rather the differences between the index and the current HEAD (commit reference) commit.

### Synopsis
```
git status [<options>...] [--] [<pathspec>...]
```

## git log
`git log` shows the commit log. The output of the commit history is given in reverse chronological order by default.

### Synopsis
```
git log [<options>] [<revision range>] [[--] <path>...]
```
### Examples
```
git log

git log --no-merges (shows whole commit history, skips merges)

git log --since="2 weeks ago" main (shows commit history of 2 weeks of the branch 'main')
```

## git reset
`git reset` resets the current HEAD to any specified state.

### Synopsis
```
git reset [-q] [<tree-ish>] [--] <pathspec>…?
git reset [-q] [--pathspec-from-file=<file> [--pathspec-file-nul]] [<tree-ish>]
git reset (--patch | -p) [<tree-ish>] [--] [<pathspec>…?]
git reset [--soft | --mixed [-N] | --hard | --merge | --keep] [-q] [<commit>]
```
### Examples
```
git reset

git reset --soft HEAD^

git reset --hard origin/main
```

## git fetch
`git fetch` downloads objects and refs from other repositories from either a single named repository or URL, or from multiple repositories if <group> is given.
When no remote is specified it defaults to `origin`.

### Synopsis
```
git fetch [<options>] [<repository> [<refspec>…?]]
git fetch [<options>] <group>
git fetch --multiple [<options>] [(<repository> | <group>)…?]
git fetch --all [<options>]
```
### Examples
```
git fetch origin

git fetch --all

git fetch https://github.com/Lokivir/git-notes.git
```

# Sources
* https://git-scm.com/docs/git-init
* https://git-scm.com/docs/git-add
* https://git-scm.com/docs/git-commit
* https://git-scm.com/docs/git-pull
* https://git-scm.com/docs/git-push
* https://git-scm.com/docs/git-status
* https://git-scm.com/docs/git-log
* https://git-scm.com/docs/git-reset
* https://git-scm.com/docs/git-fetch