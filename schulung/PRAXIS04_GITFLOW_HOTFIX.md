# Praxis 4 hotfix

Scripts: `praxis-4-hotfix.sh`, `praxis-4-bugfix.sh`

Make a hotfix like gitflow declare.

- [Hotfix command list develop/hotfix](#hotfix1)
- [Hotfix command list develop/hotfix with output](#hotfix1-commands)
- [Hotfix command list master/hotfix](#hotfix2)
- [Hotfix command list master/hotfix with output](#hotfix2-commands)

## <a name="hotfix1"></a>Hotfix command list develop/hotfix

```
# git checkout develop
# git pull

# git checkout -b bugix/[BUGFIX]
# touch bugfix-change.txt
# git add bugfix-change.txt
# git commit -m"Bugfix." bugfix-change.txt
# git push origin bugix/[BUGFIX]

=> create Pull-Request 'bugfix/[BUGFIX]' into 'develop'
-  If 'bugfix/[BUGFIX]' into 'develop' (in one commit)

# git checkout develop
# git pull
# git log                        # check that bugifx is in develop

# git checkout master
# git pull
# git checkout -b hotfix/X.1
# git cherry-pick [BUG_FIX_COMMIT_HASH]

==> create Pull-Request 'hotfix/X.1' into 'master'
-  If 'hotfix/X.Y.1' into 'master' (in one commit)

# git checkout master
# git pull
# git log                       # check that hotfix is in master

# git tag vX.1
# git push origin vX.1 master   # push hotfix tag to master == hotfix

# git checkout develop
# git log                       
```

## <a name="hotfix1-commands"></a>Hotfix command list develop/hotfix with output

```
# -------------------- bugfix --------------------
# git bugfix/BUGFIX → touch bugfx-change.txt
# git bugfix/BUGFIX* → git add bugfx-change.txt
# git bugfix/BUGFIX* → git commit -m"Bugfx 1.1" bugfx-change.txt
[bugfix/BUGFIX 00c2250] Bugfx 1.1
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 bugfx-change.txt
# git bugfix/BUGFIX → git push
Everything up-to-date
# git bugfix/BUGFIX → git push origin bugfix/BUGFIX
Counting objects: 2, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 235 bytes | 235.00 KiB/s, done.
Total 2 (delta 1), reused 0 (delta 0)
To /Users/winter/signal-iduna/svn-to-git.git
 * [new branch]      bugfix/BUGFIX -> bugfix/BUGFIX

 ==> create Pull-Request 'bugfix/X.1' into 'develop'
 -   if bugfix/X.1 is merged into develop
 -   squash commits to one if necessary

# git checkout develop
# git log
commit 00c22501f854b095ae08a6950b5b438eab68e3ec (HEAD -> develop, origin/bugfix/BUGFIX, bugfix/BUGFIX)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:11:32 2018 +0100

    Bugfx 1.1

commit 39c8bb9bd1e852de0c98770e0b1d240c2597d78d (tag: v1.0, origin/master, origin/develop, release/1.0, master)
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

# -------------------- prepare hotfix --------------------
# git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
# #git pull
Already up to date.
Current branch master is up to date.
# #git checkout hotfix/1.1
error: pathspec 'hotfix/1.1' did not match any file(s) known to git.
# #git checkout -b hotfix/1.1
Switched to a new branch 'hotfix/1.1'
# git hotfix/1.1 → git cherry-pick 00c22501f854b095ae08a6950b5b438eab68e3ec
[hotfix/1.1 8896746] Bugfx 1.1
 Date: Sun Jan 21 14:11:32 2018 +0100
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 bugfx-change.txt
# git hotfix/1.1 → git log

commit 8896746c6a624b2efc2ad5451769cff4799d35f0 (HEAD -> hotfix/1.1)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:11:32 2018 +0100

    Bugfx 1.1

commit 39c8bb9bd1e852de0c98770e0b1d240c2597d78d (tag: v1.0, origin/master, origin/develop, release/1.0, master)
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

# git push origin hotfix/1.1
Counting objects: 2, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 240 bytes | 240.00 KiB/s, done.
Total 2 (delta 1), reused 0 (delta 0)
To /Users/winter/signal-iduna/svn-to-git.git
 * [new branch]      hotfix/1.1 -> hotfix/1.1


# -------------------- hotfix --------------------
 ==> create Pull-Request 'hotfix/X.1' into 'master'
 -  If 'hotfix/X.Y.1' into 'master' (in one commit)

# git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
# git pull
Current branch master is up to date.
# git tag v1.1
# git push origin v1.1 master
Total 0 (delta 0), reused 0 (delta 0)
To /Users/winter/signal-iduna/svn-to-git.git
   39c8bb9..8896746  master -> master
 * [new tag]         v1.1 -> v1.1

# git checkout develop
# git log
commit 8896746c6a624b2efc2ad5451769cff4799d35f0 (HEAD -> develop, tag: v1.1, origin/master, origin/hotfix/1.1, master, hotfix/1.1)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:11:32 2018 +0100

    Bugfx 1.1

commit 39c8bb9bd1e852de0c98770e0b1d240c2597d78d (tag: v1.0, origin/develop, release/1.0)
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

## <a name="hotfix2"></a>Hotfix command list master/hotfix

```
# ------------------ prepare hotfix -----------------
# git checkout master
# git pull
# git checkout -b hotfix/1.2
# touch hotfix-1.2-change.txt
# git add hotfix-1.2-change.txt
# git commit -m hotfix-1.2-change.txt
# git push origin hotfix/1.2

==>

```

## <a name="hotfix2-commands"></a>Hotfix command list master/hotfix with output

```
# ------------------ prepare hotfix -----------------
# git checkout master
# git pull
Already up to date.
Current branch master is up to date.

# git checkout -b hotfix/1.2
# touch hotfix-1.2-change.txt
# git add hotfix-1.2-change.txt
# git commit -m hotfix-1.2-change.txt
[hotfix/1.2 9b72113] hotfix-1.2-change.txt
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 hotfix-1.2-change.txt
# git push origin hotfix/1.2
Counting objects: 2, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 250 bytes | 250.00 KiB/s, done.
Total 2 (delta 1), reused 0 (delta 0)
To /Users/winter/signal-iduna/svn-to-git.git
 * [new branch]      hotfix/1.2 -> hotfix/1.2

# ------------------ hotfix -----------------
# git checkout master
# git pull
Already up to date.
Current branch master is up to date.
# git log
commit 9b721134edc8e046da12961b0c9186f0e52f51c5 (HEAD -> master, origin/master, origin/hotfix/1.2, hotfix/1.2)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:39:15 2018 +0100

    hotfix-1.2-change.txt

commit 8896746c6a624b2efc2ad5451769cff4799d35f0 (tag: v1.1, origin/hotfix/1.1, origin/develop, hotfix/1.1, develop)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:11:32 2018 +0100

    Bugfx 1.1

commit 39c8bb9bd1e852de0c98770e0b1d240c2597d78d (tag: v1.0, release/1.0)
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

# git tag v1.2
# git push origin v1.2 master
Total 0 (delta 0), reused 0 (delta 0)
To /Users/winter/signal-iduna/svn-to-git.git
 * [new tag]         v1.2 -> v1.2     

# ------------------ hotfix finishing -----------------
# git checkout develop
# git pull
Already up to date.
Current branch develop is up to date.
# git cherry-pick 9b721134edc8e046da12961b0c9186f0e52f51c5
[develop d8f06d4] hotfix-1.2-change.txt
 Date: Sun Jan 21 14:39:15 2018 +0100
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 hotfix-1.2-change.txt
# ls
CHANGE_LOG.md  README.md  bugfx-change.txt  feature-change.txt	hotfix-1.2-change.txt
# git log
commit d8f06d4e6e41467dea7b9658a0f3765afdc07436 (HEAD -> develop)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:39:15 2018 +0100

    hotfix-1.2-change.txt

commit 8896746c6a624b2efc2ad5451769cff4799d35f0 (tag: v1.1, origin/hotfix/1.1, origin/develop, hotfix/1.1)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:11:32 2018 +0100

    Bugfx 1.1

commit 39c8bb9bd1e852de0c98770e0b1d240c2597d78d (tag: v1.0, release/1.0)
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
