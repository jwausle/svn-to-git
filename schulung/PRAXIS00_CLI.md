# GIT command line

Scripts: `praxis-0-add.sh`, `praxis-0-branch.sh`, `praxis-0-graph.sh`

- [GIT command help](#help)
- [INIT and CLONE a repository](#repo)
- [ADD, MV, RM, RESET and COMMIT files in present branch](#files)
 - [ADD, MV, RM, RESET and COMMIT files command list](#files-commands)
 - [ADD, MV, RM, RESET and COMMIT files command list with output](#files-output)
- [BRANCH, CHECKOUT, MERGE and REBASE on branches](#branches)
 - [BRANCH, CHECKOUT, MERGE and REBASE command list](#branches-commands)
 - [BRANCH, CHECKOUT, MERGE and REBASE command list with out put](#branches-output)

# <a name="help"></a>GIT command help

```
usage: git [--version] [--help] [-C <path>] [-c name=value]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone      Clone a repository into a new directory
   init       Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add        Add file contents to the index
   mv         Move or rename a file, a directory, or a symlink
   reset      Reset current HEAD to the specified state
   rm         Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect     Use binary search to find the commit that introduced a bug
   grep       Print lines matching a pattern
   log        Show commit logs
   show       Show various types of objects
   status     Show the working tree status

grow, mark and tweak your common history
   branch     List, create, or delete branches
   checkout   Switch branches or restore working tree files
   commit     Record changes to the repository
   diff       Show changes between commits, commit and working tree, etc
   merge      Join two or more development histories together
   rebase     Reapply commits on top of another base tip
   tag        Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch      Download objects and refs from another repository
   pull       Fetch from and integrate with another repository or a local branch
   push       Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.
```

# <a name="repo"></a>INIT and CLONE a repository

Setup a local directory as git repository.

```
mkdir tmp-dir
cd tmp-dir
git init
```

Clone comes later.

# <a name="files"></a>ADD, MV, RM, RESET and COMMIT files in present branch

Traverse files between the states (untracked, staged, modifies, commited).

## <a name="files-commands"></a>ADD, MV, RM, RESET and COMMIT command list

```
# touch text.file
# ls
# git add text.file
# git status   # => show state: file ready for commit

# git rm text.file --cached
# git ls
# git status   # => show state: file ready for add

# git add text.file
# git rm text.file -f
# ls           # => show nothing: file was deleted

# touch text.file
# git mv text.file moved-text.file # -> Expected fatal:...

# git add text.file
# git mv text.file moved-text.file
# ls           # => show moved-text.file

# git commit -m"Added moved-text.file" moved-text.file
# git rm moved-text.file
# ls
# git status   # => show deleted file im index
```

## <a name="files-output"></a>ADD, MV, RM, RESET and COMMIT command list with output

```
# touch text.file
# ls
text.file
# git add text.file
# git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   text.file

# git rm text.file --cached
# ls
text.file

# git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	text.file

nothing added to commit but untracked files present (use "git add" to track)  

# git add text.file
# git rm text.file -f
# ls

# touch text.file
# git mv text.file moved-text.file
fatal: not under version control, source=text.file, destination=moved-text.file

# git add text.file
# git mv text.file moved-text.file
# ls
moved-text.file

# git commit -m"Added moved-text.file" moved-text.file
[master (root-commit) 4b7e399] Added moved-text.file
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 moved-text.file
# git rm moved-text.file
# ls
# git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	deleted:    moved-text.file
# git commit -m"Deleted moved-text-file"
# git log
commit 8a113c08d231c2693caf0a1fc2bc74c07ccb0871 (HEAD -> master)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:13:40 2018 +0100

    Moved file.txt to moved.txt

commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt

# git reset --hard 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
# git log
commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt
```

# <a name="branches"></a>BRANCH, CHECKOUT, MERGE and REBASE on branches

Switch between the branches.

## <a name="branches-commands"></a>BRANCH, CHECKOUT, MERGE and REBASE command list

```
# git branch
* master

# git checkout -b local-branch

# find .git/refs/heads
# git log         # history master == local-branch
# echo "overwrite content" > file.txt
# git add file.txt
# git commit -m"Change content in local-brache" .
# git log         # show 'local-branch' history
# git checkout master

# git log         # show log before 'merge'
# git merge local-branch
# git log         # show log after 'merge'

# git reset [SELECT_FIRST_HASH] --hard

# git log         # show log before 'rebase'
# git rebase local-branch
# git log         # show log after 'rebase'

# git reset [SELECT_FIRST_HASH] --hard

# touch file2.txt
# git add file2.txt
# git commit -m"Added file after branch creation." file2.txt
# git git log     # show log before 'merge'

# git merge local-branch
# git log         # show log after 'merge'

# git reset [SELECT_FIRST_HASH] --hard

# git touch file2.txt
# git add file2.txt
# git commit -m"Added file2 after branch creation." file2.txt
# git log         # show history before 'rebase'

# git rebase local-branch
# git log         # show history after 'rebase'
```

## <a name="branches-output"></a>BRANCH, CHECKOUT, MERGE and REBASE command list with output

```
# git branch
* master
# git checkout -b local-branch
Switched to a new branch 'local-branch'
# find .git/refs/heads
.git/refs/heads
.git/refs/heads/local-branch
.git/refs/heads/master
# git log
# echo "overwrite content" > file.txt
# git add file.txt
# git commit -m"Change content in local-brache" .
[local-branch 7b47fc2] Change content in local-brache
 1 file changed, 1 insertion(+)
# git log
commit 7b47fc2778118c447eb591d6f1421f66441545aa (local-branch)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:28:54 2018 +0100

    Change content in local-brache

commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e => SELECT_FIRST_HASH
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt
# cat file.txt
overwrite content
# git checkout master
Switched to branch 'master'
# cat file.txt
# git log
# git merge local-branch
Updating 9091a8c..7b47fc2
Fast-forward
 file.txt | 1 +
 1 file changed, 1 insertion(+)
# cat file.txt
overwrite content
# git log
commit 7b47fc2778118c447eb591d6f1421f66441545aa (local-branch)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:28:54 2018 +0100

    Change content in local-branch

commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt  

# git reset [SELECT_FIRST_HASH] --hard
HEAD is now at 9091a8c Added file.txt
# cat file.txt
# git rebase local-branch
First, rewinding head to replay your work on top of it...
Fast-forwarded master to local-branch.
# git log
commit 7b47fc2778118c447eb591d6f1421f66441545aa (local-branch)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:28:54 2018 +0100

    Change content in local-branch

commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt

# git reset [SELECT_FIRST_HASH] --hard
HEAD is now at 9091a8c Added file.txt
# touch file2.txt
# git add file2.txt
# git commit -m"Added file after branch creation." file2.txt
[master fc66269] Added file after branch creation.
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2.txt
# git git log
commit d358cca0d13effcc21faec87398dbd6ebfdef9ba (HEAD -> master)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:59:05 2018 +0100

    Added file2 after branch creation.

commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt

# git merge local-branch
Merge made by the 'recursive' strategy.
 file.txt | 1 +
 1 file changed, 1 insertion(+)
# git log
commit cd3491aceff859b6bd947c52d3e5441f11562b13 (HEAD -> master)
Merge: d358cca 44e846e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:59:41 2018 +0100

    Merge branch 'local-branch'

commit d358cca0d13effcc21faec87398dbd6ebfdef9ba
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:59:05 2018 +0100

    Added file2 after branch creation.

commit 44e846e7ea6dab89922a509d937ae16a878b9fe5 (local-branch)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:53:49 2018 +0100

    Change content in local-brache

commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt

# git reset [SELECT_FIRST_HASH] --hard

# git touch file2.txt
# git add file2.txt
# git commit -m"Added file2 after branch creation." file2.txt
# git log
commit 96eb5c766566942e08663ac0a77d96aad211daa8 (HEAD -> master)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 18:03:08 2018 +0100

    Added file2 after branch creation.

commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt

# git rebase local-branch
First, rewinding head to replay your work on top of it...
Applying: Added file after branch creation.

# git log
commit ff97fef3faad72183316302a765df12437115ad6 (HEAD -> master)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 18:03:08 2018 +0100

    Added file2 after branch creation.

commit 44e846e7ea6dab89922a509d937ae16a878b9fe5 (local-branch)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:53:49 2018 +0100

    Change content in local-brache

commit 9091a8c3dcd3282f6615efc20ba4791b9ac3263e
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 17:08:36 2018 +0100

    Added file.txt
```
