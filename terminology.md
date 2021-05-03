Terminology
===========

|Terminology                |Meaning                                                                                                        |
|---------------------------|---------------------------------------------------------------------------------------------------------------|
|repository                 |it includes all files with all previous versions                                                               |
|remote repository          |repositories hosted on any server (e.g. GitHub, GitLab, etc.)                                                  |
|centralized repository     |the repository is located at one place (local machine, server, etc.) and provides access to many clients       |
|decentralized repository   |every user has a local copy of the repository in addition to the central repository on the server side         |
|branch                     |copy of the main code for development and testing of different code                                            |
|merging                    |e.g. merging a branch with the main branch (source code)                                                       |
|working copy               |a local repository, or a local copy of a repository, which can be accessed and worked on offline               |
|index/staging area         |holds the information what has been added for commit and what hasn't been                                      |
|modified                   |modified files are files, which were modified and not added to the index (not staged)                          |
|staged                     |staged files are files, which have been added to the index and are ready for commit                            |
|commited                   |commited files are files, which were in the index and are now ready for being pushed to a remote repository    |
|command                    |"`git` commit -m 'Hello'"                                                                                      |
|argument                   |"git `commit` -m 'Hello'"                                                                                      |
|option                     |"git commit `-m` 'Hello'"                                                                                      |
|option value               |"git commit -m `'Hello'`"                                                                                      |
|snapshot                   |a snapshot is the content (files and directories) of a repository at some point in time                        |
|head                       |points to the last commit made                                                                                 |