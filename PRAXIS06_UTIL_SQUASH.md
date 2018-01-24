# Paxis 6 squash

Squash take a set of commits and collect these to 1 commit (== sqaushing).

## Squash command list

```
# git checkout -b tmp/squash-branch
# touch afile.txt
# git add afile.txt
# git commit -m"Add afile" afile.txt

# touch another.file
# git add another.file
# git commit -m"Add another file" another.file

# git log      # 2 commits in history
# git rebase -i HEAD~3
# git log      # 1 commit in history
```

## Squash command list with output

```
# git checkout -b tmp/squash-branch
Switched to a new branch 'tmp/squash-branch'
# touch afile.txt
# git add afile.txt
# git commit -m"Add afile" afile.txt
[tmp/squash-branch 2427e99] Add afile
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 afile.txt
# touch another.file
# git add another.file
# git commit -m"Add another file" another.file
[tmp/squash-branch 4970e26] Add another file
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 another.file
# git log

commit 4970e2679688a92d6dd9ec7cc0ea217c1767dd88 (HEAD -> tmp/squash-branch)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 15:01:47 2018 +0100

    Add another file

commit 2427e9996a3aed1eed28d99017f2982dce2056de
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 15:00:54 2018 +0100

    Add afile

commit c82392143d50fa5acf4dd48427bd669da7bcc6ce (tag: v2.0, origin/master, release/2.0, master, develop)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:53:56 2018 +0100

    Added 2.0 release changes

# git rebase -i HEAD~3
+ Configured editor will open (@see git config --global core.editor "nano|vi|..")
| pick c823921 Added 2.0 release changes
| pick 2427e99 Add afile
| s 4970e26 Add another file
| # Rebase 9b72113..4970e26 onto 9b72113 (3 commands)
| #
| # Commands:
| # p, pick = use commit
| # r, reword = use commit, but edit the commit message
| # e, edit = use commit, but stop for amending
| # s, squash = use commit, but meld into previous commit
| # f, fixup = like "squash", but discard this commit's log message
| # x, exec = run command (the rest of the line) using shell
| # d, drop = remove commit
| #
| # These lines can be re-ordered; they are executed from top to bottom.
| #
| # If you remove a line here THAT COMMIT WILL BE LOST.
| #
| # However, if you remove everything, the rebase will be aborted.
| #
| # Note that empty commits are commented out

# git log
commit 4e1a11844a04cd10dcb29ec63c2c754e3daec7fa (HEAD -> tmp/squash-branch)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 15:00:54 2018 +0100

    Add afile
    Add another file

commit c82392143d50fa5acf4dd48427bd669da7bcc6ce (tag: v2.0, origin/master, release/2.0, master, develop)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sun Jan 21 14:53:56 2018 +0100

```
