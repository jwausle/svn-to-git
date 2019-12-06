# Praxis 3 release

Make a release like gitflow declare.

Scripts: `praxis-3.sh`

## Release command list

```
# git checkout develop
# git pull

# git checkout -b feature/[YOUR_FEATURE]
# touch feature-change.txt
# git add feature-change.txt
# git commit -m"Added feature." feature-change.txt
# git push origin feature/[YOUR_FEATURE]

=> create Pull-Request 'feature/[YOUR_FEATURE]' into 'develop'
-  If feature/[YOUR_FEATURE] merged into develop

# git checkout develop
# git pull
# git log                       # check that feature is in develop

# git checkout -b release/X.0
# echo "CHANGE_LOG.md" > CHANGE_LOG.md
# git add CHANGE_LOG.md
# git commit -m"Added CHANGE_LOG." CHANGE_LOG.md

==> create Pull-Request 'release/X.0' into 'master'
-   if relase/X.0 is merged into master

# git checkout master
# git pull
# git log                       # check that feature is in master

# git tag vX.0
# git push origin vX.0 master   # push release tag to master == release

# git checkout develop
# git merge master              # merge release-merge and tag back to master
# git push
```

## Release command list with output

```
# ---------------------- feature -------------------------
# git checkout -b feature/SAMPLE_FEATURE
Switched to a new branch 'feature/SAMPLE_FEATURE'
# git feature/SAMPLE_FEATURE → touch feature-change.txt
# git feature/SAMPLE_FEATURE* → git add feature-change.txt
# git feature/SAMPLE_FEATURE* → git commit -m"Added feature change." feature-change.txt
[feature/SAMPLE_FEATURE 197b996] Added feature change.
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 feature-change.txt

# git feature/SAMPLE_FEATURE → git push origin feature/SAMPLE_FEATURE
Counting objects: 2, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 266 bytes | 266.00 KiB/s, done.
Total 2 (delta 0), reused 0 (delta 0)
To /Users/winter/signal-iduna/svn-to-git.git
 * [new branch]      feature/SAMPLE_FEATURE -> feature/SAMPLE_FEATURE

 => create Pull-Request 'feature/[YOUR_FEATURE]' into 'develop'
 -  If feature/[YOUR_FEATURE] merged into develop

# git feature/SAMPLE_FEATURE → git checkout develop
Switched to branch 'develop'
Your branch is up to date with 'origin/develop'.

# git pull
Current branch develop is up to date.
# git log
commit 197b99621801dbbb52d2e8a7fd86b52a0c5d9732 (HEAD -> develop, origin/feature/SAMPLE_FEATURE, feature/SAMPLE_FEATURE)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 13:51:51 2018 +0100

    Added feature change.

commit 18a92f184803fb02f7757d6c1bb005f24a997063 (origin/master, origin/develop, master)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 13:49:08 2018 +0100

    Inital commit

# --------------------- prepare release -------------------------
# git develop → git checkout -b release/1.0
Switched to a new branch 'release/1.0'
# touch CHANGE_LOG.md
# echo "1.0 changes ... " >> CHANGE_LOG.md
# git add CHANGE_LOG.md
# git commit -m"Added 1.0 change log." CHANGE_LOG.md
[release/1.0 39c8bb9] Added 1.0 change log.
 1 file changed, 1 insertion(+)
 create mode 100644 CHANGE_LOG.md
# git push  

==> create Pull-Request 'release/X.0' into 'master'
-   if relase/X.0 is merged into master

# git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
# git pull
Already up to date.
Current branch master is up to date.
# git log
Total 0 (delta 0), reused 0 (delta 0)
commit 39c8bb9bd1e852de0c98770e0b1d240c2597d78d (HEAD -> master, release/1.0)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:00:24 2018 +0100

    Added 1.0 change log.

commit 197b99621801dbbb52d2e8a7fd86b52a0c5d9732 (origin/feature/SAMPLE_FEATURE, feature/SAMPLE_FEATURE, develop)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 13:51:51 2018 +0100

    Added feature change.

commit 18a92f184803fb02f7757d6c1bb005f24a997063 (origin/master, origin/develop)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 13:49:08 2018 +0100

    Inital commit

# ------------------------- release ------------------------------
# git tag v1.0
# git push origin v1.0 master
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 330 bytes | 330.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To /Users/winter/signal-iduna/svn-to-git.git
   18a92f1..39c8bb9  master -> master
 * [new tag]         v1.0 -> v1.0
# git checkou develop
git: 'checkou' is not a git command. See 'git --help'.
# git checkout develop
Switched to branch 'develop'
Your branch is ahead of 'origin/develop' by 1 commit.
  (use "git push" to publish your local commits)
# git merge master
Updating 197b996..39c8bb9
Fast-forward
 CHANGE_LOG.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 CHANGE_LOG.md
# git push
Total 0 (delta 0), reused 0 (delta 0)
To /Users/winter/signal-iduna/svn-to-git.git
   18a92f1..39c8bb9  develop -> develop
# git log

commit 39c8bb9bd1e852de0c98770e0b1d240c2597d78d (HEAD -> develop, tag: v1.0, origin/master, origin/develop, release/1.0, master)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:00:24 2018 +0100

    Added 1.0 change log.

commit 197b99621801dbbb52d2e8a7fd86b52a0c5d9732 (origin/feature/SAMPLE_FEATURE, feature/SAMPLE_FEATURE)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 13:51:51 2018 +0100

    Added feature change.

commit 18a92f184803fb02f7757d6c1bb005f24a997063
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 13:49:08 2018 +0100

    Inital commit
```
