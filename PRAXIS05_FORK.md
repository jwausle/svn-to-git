# Praxis 5 fork


## Fork command list

```
# git clone /Users/winter/signal-iduna/svn-to-git-fork.git svn-to-git-fork
# cd svn-to-git-fork
# git config --local -l

# git remote add upstream /Users/winter/signal-iduna/svn-to-git.git
# git checkout develop
# git pull

# git checkout -b my-fork-feature

# git branch --set-upstream-to=upstream/develop develop  # error expected
# git pull upstream develop
# git branch --set-upstream-to=upstream/develop develop

# git config --local -l         # to show associations

# touch your-change.file
# git add your-change.file
# git commit -m"Added your forked change" your-change.file

# ----------- wait for a change in upstream/develop
# git fetch upstream develop   
# ls
# git push origin my-fork-feature

==> create PR from origin/my-fork-feature to upstream/develop
```

## Fork command list with output

```
# git clone /Users/winter/signal-iduna/svn-to-git-fork.git svn-to-git-fork
Cloning into 'svn-to-git-fork'...
done.
# cd svn-to-git-fork
# git config --local -l
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
core.precomposeunicode=true
remote.origin.url=/Users/winter/signal-iduna/svn-to-git-fork.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.master.remote=origin
branch.master.merge=refs/heads/master
branch.master.rebase=true

# git remote add upstream /Users/winter/signal-iduna/svn-to-git.git


# git checkout develop
Branch 'develop' set up to track remote branch 'develop' from 'origin' by rebasing.
Switched to a new branch 'develop'
# git pull
Already up to date.
Current branch develop is up to date.

# git checkout -b my-fork-feature
Switched to a new branch 'my-fork-feature'

# git branch --set-upstream-to=upstream/develop develop
error: the requested upstream branch 'upstream/develop' does not exist
hint:
hint: If you are planning on basing your work on an upstream
hint: branch that already exists at the remote, you may need to
hint: run "git fetch" to retrieve it.
hint:
hint: If you are planning to push out a new local branch that
hint: will track its remote counterpart, you may want to use
hint: "git push -u" to set the upstream config as you push.

# git pull upstream develop
From /Users/winter/signal-iduna/svn-to-git
 * branch            develop    -> FETCH_HEAD
 * [new branch]      develop    -> upstream/develop
Already up to date.

# git branch --set-upstream-to=upstream/develop develop
Branch 'develop' set up to track remote branch 'develop' from 'upstream' by rebasing.

# git config --local -l
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
core.precomposeunicode=true
remote.origin.url=/Users/winter/signal-iduna/svn-to-git-fork.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.master.remote=origin
branch.master.merge=refs/heads/master
branch.master.rebase=true
remote.upstream.url=/Users/winter/signal-iduna/svn-to-git.git
remote.upstream.fetch=+refs/heads/*:refs/remotes/upstream/*
branch.develop.remote=upstream
branch.develop.merge=refs/heads/develop
branch.develop.rebase=true

# touch your-change.file
# git add your-change.file
# git commit -m"Added your forked change" your-change.file

# ----------- wait for a change in upstream/develop

# git fetch upstream develop
remote: Counting objects: 2, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 2 (delta 1), reused 0 (delta 0)
Unpacking objects: 100% (2/2), done.
From /Users/winter/signal-iduna/svn-to-git
 * branch            develop    -> FETCH_HEAD
   c823921..95c4a82  develop    -> upstream/develop
# git rebase upstream/develop
First, rewinding head to replay your work on top of it...
Fast-forwarded my-fork-feature to upstream/develop.
# ls
CHANGE_LOG.md  README.md  added-file-after-fork.txt  bugfx-change.txt  feature-change.txt  hotfix-1.2-change.txt


# git push origin my-fork-feature

==> create PR from origin/my-fork-feature to upstream/develop
```
