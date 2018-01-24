# Stash changes to pull changes

Stash is a local utility to cache local uncommited and untracked changes for a later use. Typical use-case: I want to switch the branch for a code review from a Pull-Request.

## Stash command list

```
# git checkout develop
# git pull
# git checkout -b tmp/branch

# git checkout develop
# echo "this commit force conflict" > another.file
# git add another.file
# git commit -m"Added another.file to force stashing." another.file

# git checkout tmp/branch
# touch another.file
# git checkout develop
# git status      
# git stash save -u      # cache untracked files too

# git checkout develop
# git reset  c82392143d50fa5acf4dd48427bd669da7bcc6ce  --hard # reset to origin/develop/HEAD
# git status             # alredy up-to-date

# git checkout tmp/branch
# git stash pop
# ls another.file        # voila another.file was loaded from stash
```

## Stash command list with output

```
# git checkout develop
# git pull
# git checkout -b tmp/branch
# git checkout develop

# echo "this commit force conflict" > another.file
# git add another.file
# git commit -m"Added another.file to force stashing." another.file
[develop d35d34d] Added another.file to force stashing.
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 another.file

# git checkout tmp/branch
# touch another.file
# git checkout develop
error: The following untracked working tree files would be overwritten by checkout:
	another.file
Please move or remove them before you switch branches.
Aborting
# git status
On branch tmp/branch
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	another.file

nothing added to commit but untracked files present (use "git add" to track)
# git stash save
No local changes to save
# git stash save --help
# git stash save -u
Saved working directory and index state WIP on tmp/branch: c823921 Added 2.0 release changes
# git checkout develop
Switched to branch 'develop'
Your branch is ahead of 'origin/develop' by 2 commits.
  (use "git push" to publish your local commits)


# git reset  c82392143d50fa5acf4dd48427bd669da7bcc6ce  --hard
HEAD is now at c823921 Added 2.0 release changes
# ls
CHANGE_LOG.md  README.md  another.file	bugfx-change.txt  feature-change.txt  hotfix-1.2-change.txt
# rm another.file
# git status
On branch develop
Your branch is ahead of 'origin/develop' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
# git checkout tmp/branch
Switched to branch 'tmp/branch'
# git stash pop
Already up to date!
On branch tmp/branch
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	another.file

nothing added to commit but untracked files present (use "git add" to track)
Dropped refs/stash@{0} (e7e5eb47f76d53e5373bf1b41531888f39319d5e)  
# ls another.file
another.file
```
