Git Commands
=============
This is a little "documentary" for git commands on what they are, what they do and how to use them.

## git init
`git init` creates an empty repository or reinitializes an existing one.

Running it in an existing repository is safe, because it won't overwrite anything that's already there.
You want to rerun  it, either to pick up added templates or to move it to another place (if `--separate-git-dir` is given).

### Synopsis
```bash
git init [-q | --quiet] [--bare] [--template=<template_directory>]
	  [--separate-git-dir <git dir>] [--object-format=<format>]
	  [-b <branch-name> | --initial-branch=<branch-name>]
	  [--shared[=<permissions>]] [directory]
```

### Examples
```bash
git init /home/user/git-notes/

or

cd /home/user/git-notes/
git init
```

## git add
`git add` updates the index for the next commit.
The index is the staging area between your working directory (or working copy) and your repository. 
So by using the 'git add' command you can add new or modified files (changes to be commited) to the index, before committing them together to the repository.

>By using 'git add .' you update the index including everything (new, modified and deleted files altogether).

### Synopsis
```bash
git add [--verbose | -v] [--dry-run | -n] [--force | -f] [--interactive | -i] [--patch | -p]
	  [--edit | -e] [--[no-]all | --[no-]ignore-removal | [--update | -u]]
	  [--intent-to-add | -N] [--refresh] [--ignore-errors] [--ignore-missing] [--renormalize]
	  [--chmod=(+|-)x] [--pathspec-from-file=<file> [--pathspec-file-nul]]
	  [--] [<pathspec>â€¦â€‹]
```

### Examples
|command				|execution														|
|-----------------------|---------------------------------------------------------------|
|`git add commands.md`	|adds *commands.md* to the index								|
|`git add .`			|adds all new and modified files from the **working directory**	|
|`git add --all`		|same as `git add .` but including the **whole** project		|

## git commit
`git commit` records the changes made to the index (staged files) by committing them with a log message to the repository.
>By using `git commit --amend` you can combine staged changes with the previous commit instead of creating a new commit and to edit the previous commit message without changing its snapshot.

### Synopsis
```bash
git commit [-a | --interactive | --patch] [-s] [-v] [-u<mode>] [--amend]
	   [--dry-run] [(-c | -C | --fixup | --squash) <commit>]
	   [-F <file> | -m <msg>] [--reset-author] [--allow-empty]
	   [--allow-empty-message] [--no-verify] [-e] [--author=<author>]
	   [--date=<date>] [--cleanup=<mode>] [--[no-]status]
	   [-i | -o] [--pathspec-from-file=<file> [--pathspec-file-nul]]
	   [-S[<keyid>]] [--] [<pathspec>â€¦â€‹]
```
### Examples

```bash
git add commands.md
git commit -m "added commands.md"
```

## git pull
`git pull` fetches from a repository and integrates it with another repository or a local branch.


### Synopsis
```bash
git pull [<options>] [<repository> [<refspec>â€¦â€‹]]
```
### Examples
```bash
git pull (default parameter is 'origin')

git pull origin
```


## git push
`git push` updates the remote repository by uploading and synchronizing it with the local one.
### Synopsis
```bash
git push [--all | --mirror | --tags] [--follow-tags] [--atomic] [-n | --dry-run] [--receive-pack=<git-receive-pack>]
	   [--repo=<repository>] [-f | --force] [-d | --delete] [--prune] [-v | --verbose]
	   [-u | --set-upstream] [-o <string> | --push-option=<string>]
	   [--[no-]signed|--signed=(true|false|if-asked)]
	   [--force-with-lease[=<refname>[:<expect>]] [--force-if-includes]]
	   [--no-verify] [<repository> [<refspec>â€¦â€‹]]
```
### Examples
```bash
git push (default parameter is 'origin')

git push origin

git push <remote> (remote is the current branchs remote)
```

## git status
`git status` shows if there are any modified files to be staged, what files are already staged and by that, what can be committed.

### Synopsis
```bash
git status [<options>â€¦â€‹] [--] [<pathspec>â€¦â€‹]
```

## git log
`git log` shows the commit log. The output of the commit history is given in reverse chronological order by default.

### Synopsis
```bash
git log [<options>] [<revision range>] [[--] <path>â€¦â€‹]
```
### Examples
```bash
git log

git log --no-merges (shows whole commit history, skips merges)

git log --since="2 weeks ago" main (shows commit history of 2 weeks of the branch 'main')
```

## git reset
`git reset` resets the current HEAD to any specified state.
Be careful with this, because `git reset` is a destructive operation, as it can (an will) delete unsynchronized parts of your local working copy.

### Synopsis
```bash
git reset [-q] [<tree-ish>] [--] <pathspec>â€¦â€‹
git reset [-q] [--pathspec-from-file=<file> [--pathspec-file-nul]] [<tree-ish>]
git reset (--patch | -p) [<tree-ish>] [--] [<pathspec>â€¦â€‹]
git reset [--soft | --mixed [-N] | --hard | --merge | --keep] [-q] [<commit>]
```
### Examples
```bash
git reset

git reset --soft HEAD^

git reset --hard origin/main
```

## git fetch
`git fetch` downloads objects and refs from other repositories from either a single named repository or URL, or from multiple repositories if <group> is given.
When no remote is specified it defaults to `origin`.

### Synopsis
```bash
git fetch [<options>] [<repository> [<refspec>â€¦â€‹]]
git fetch [<options>] <group>
git fetch --multiple [<options>] [(<repository> | <group>)â€¦â€‹]
git fetch --all [<options>]
```
### Examples
```bash
git fetch origin

git fetch --all

git fetch https://github.com/Lokivir/git-notes.git
```

## git rm
`git rm` removes files from the working copy and the index/staging area.

### Synopsis
```bash
git rm [-f | --force] [-n] [-r] [--cached] [--ignore-unmatch]
	  [--quiet] [--pathspec-from-file=<file> [--pathspec-file-nul]]
	  [--] [<pathspec>â€¦â€‹]
```

### Examples
```bash
git rm ./\*.md (removes all *.md files from the current directory and its subdiretories)

git rm -f ./commands.md (removes the commands.md file from the current directory)
```
## git mv
With `git mv` you can move or rename a file, a directory or a symlink (link to a file or directory).

### Synopsis
```bash
git mv <options>â€¦â€‹ <args>â€¦â€‹
```

### Examples
```bash
git mv commands.md ./test/ (moves commands.md into the "test" directory)
```

## git diff
`git diff` shows changes made between commits. If you add modified files to the staging area, `git diff` won't show you anything different, because you already added them. It will only work before adding something to the staging area.
>If you have already staged some files, you can use `git diff --staged` to see the difference made.

### Synopsis
```bash
git diff [<options>] [<commit>] [--] [<path>â€¦â€‹]
git diff [<options>] --cached [--merge-base] [<commit>] [--] [<path>â€¦â€‹]
git diff [<options>] [--merge-base] <commit> [<commit>â€¦â€‹] <commit> [--] [<path>â€¦â€‹]
git diff [<options>] <commiâ€¦â€‹â€‹<commit> [--] [<path>â€¦â€‹]
git diff [<options>] <blob> <blob>
git diff [<options>] --no-index [--] <path> <path>
```

### Examples
#### Check working copy
```bash
git diff 				(1)

git diff --cached		(2)

git diff HEAD			(3)
```
1. Changes in the working tree not yet staged for the next commit.

2. Changes between the index and your last commit; what you would be committing if you run git commit without -a option.

3. Changes in the working tree since your last commit; what you would be committing if you run git commit -a

#### Comparing with arbitrary commits
```bash
git diff master			(1)

git diff HEAD^ HEAD		(2)
```
1. Instead of using the tip of the current branch, compare with the tip of "test" branch.
2. Compare the version before the last commit and the last commit.

#### Comparing branches
```bash
git diff main master
```
Changes between the tips of the topic and the master branches.

## git clone
As the name suggests, `git clone` clones a repository into a newly created directory, creates remote-tracking branches for each branch and creates and checks out an initial branch from the cloned repository's active branch.

### Synopsis
```bash
git clone [--template=<template_directory>]
	  [-l] [-s] [--no-hardlinks] [-q] [-n] [--bare] [--mirror]
	  [-o <name>] [-b <name>] [-u <upload-pack>] [--reference <repository>]
	  [--dissociate] [--separate-git-dir <git dir>]
	  [--depth <depth>] [--[no-]single-branch] [--no-tags]
	  [--recurse-submodules[=<pathspec>]] [--[no-]shallow-submodules]
	  [--[no-]remote-submodules] [--jobs <n>] [--sparse]
	  [--filter=<filter>] [--] <repository>
	  [<directory>]

```
### Examples
```
git clone https://github.com/Lokivir/git-notes.git

git clone --bare https://github.com/Lokivir/git-notes.git
```

## git remote
`git remote` manages the set of repositories, your "remotes", whose branches you track.

### Synopsis
```bash
git remote [-v | --verbose]
git remote add [-t <branch>] [-m <master>] [-f] [--[no-]tags] [--mirror=(fetch|push)] <name> <url>
git remote rename <old> <new>
git remote remove <name>
git remote set-head <name> (-a | --auto | -d | --delete | <branch>)
git remote set-branches [--add] <name> <branch>…​
git remote get-url [--push] [--all] <name>
git remote set-url [--push] <name> <newurl> [<oldurl>]
git remote set-url --add [--push] <name> <newurl>
git remote set-url --delete [--push] <name> <url>
git remote [-v | --verbose] show [-n] <name>…​
git remote prune [-n | --dry-run] <name>…​
git remote [-v | --verbose] update [-p | --prune] [(<group> | <remote>)…​]
```

### Examples
```bash
git remote show origin
# * remote origin
#   Fetch URL: https://github.com/Lokivir/git-notes.git
#   Push  URL: https://github.com/Lokivir/git-notes.git
#   HEAD branch: main
#   Local ref configured for 'git push':
#     main pushes to main (up to date)

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
* https://git-scm.com/docs/git-rm
* https://git-scm.com/docs/git-mv
* https://git-scm.com/docs/git-diff
* https://git-scm.com/docs/git-clone
* https://git-scm.com/docs/git-remote