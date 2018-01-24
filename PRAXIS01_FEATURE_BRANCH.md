# Praxis 1 first push

Init a local repository, do a first commit and configure a upstream origin to push Your first commit.

## Paxis 1 commands

```
# mkdir svn-to-git && cd svn-to-git
# git init
# find .
# git status
# git checkout -b master
# touch my-first-file.txt
# git status

# git add my-first-file.txt
# git status

# git commit -m"Added first file." my-first-file.txt
# git status
# git log

# git fetch     # => expected fatal: No remote ...
# git remote add origin https://winter@gitlab-extern.itemis.de/itemis-education/svn-to-git.git
# git config -l

# git branch -a
# git fetch
# git branch -a

# git log remotes/origin/master
# git log origin/master

# git pull      # => There is no tracking information for the current branch....

# git branch --set-upstream-to=origin/master master
# git config -l --local

# git pull
# git log       # show Your changes HEAD
# git push     
```

## Praxis 1 commands with output

```
# mkdir svn-to-git && cd svn-to-git

# git init
Initialized empty Git repository in /Users/winter/signal-iduna/svn-to-git/.git/

# git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

# find .
.
./.git
./.git/config
./.git/objects
./.git/objects/pack
./.git/objects/info
./.git/HEAD
./.git/info
./.git/info/exclude
./.git/description
./.git/hooks
./.git/hooks/commit-msg.sample
./.git/hooks/pre-rebase.sample
./.git/hooks/pre-commit.sample
./.git/hooks/applypatch-msg.sample
./.git/hooks/pre-receive.sample
./.git/hooks/prepare-commit-msg.sample
./.git/hooks/post-update.sample
./.git/hooks/pre-applypatch.sample
./.git/hooks/pre-push.sample
./.git/hooks/update.sample
./.git/refs
./.git/refs/heads
./.git/refs/tags

# git checkout -b master
Switched to a new branch 'master'

# git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

# touch my-first-file.txt
# git status?
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	my-first-file.txt

nothing added to commit but untracked files present (use "git add" to track)

# git add my-first-file.txt
# git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   my-first-file.txt

# commit -m"Added first file." my-first-file.txt
[master (root-commit) 46027d9] Added first file.
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 my-first-file.txt

# git status
On branch master
nothing to commit, working tree clean

# git log
commit f6678b235b70d78faf7d99356535eb394f95c2a8 (HEAD -> master)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 09:54:54 2018 +0100

    Added first file.

# git fetch
fatal: No remote repository specified.  Please, specify either a URL or a
remote name from which new revisions should be fetched.

# git remote add origin https://winter@gitlab-extern.itemis.de/itemis-education/svn-to-git.git
# git config -l --local
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
core.precomposeunicode=true
remote.origin.url=https://winter@gitlab-extern.itemis.de/itemis-education/svn-to-git.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*

# git branch -a
* master

# git fetch
warning: no common commits
remote: Counting objects: 49, done.
remote: Compressing objects: 100% (29/29), done.
remote: Total 49 (delta 14), reused 45 (delta 13)
Unpacking objects: 100% (49/49), done.
From https://gitlab-extern.itemis.de/itemis-education/svn-to-git
 * [new branch]      master     -> origin/master

# git branch -a
* master
  remotes/origin/master

# git log remotes/origin/master
# git log origin/master  

# git branch --set-upstream-to=origin/master master
Branch 'master' set up to track remote branch 'master' from 'origin' by rebasing.

# git config -l --local
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
core.precomposeunicode=true
remote.origin.url=https://winter@gitlab-extern.itemis.de/itemis-education/svn-to-git.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.master.remote=origin
branch.master.merge=refs/heads/master
branch.master.rebase=true

# git pull

# git log
core.filemode=true
core.bare=false
core.logallrefupdates=true
commit 3c19b9ac35cc11ef905a498423786b156ae143db (HEAD -> master)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 18:50:55 2018 +0100

    Added first file.

commit df1a23925548a7dd776111b577927f24083e57d2 (origin/master)
Author: Your Name <you@example.com>
Date:   Mon Dec 11 09:45:52 2017 +0100

    Updated README.md

# git push     
```
