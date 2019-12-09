#!/bin/bash
echo "# Create branch"
echo "git branch"
echo "git checkout -b local-branch"
echo "find .git/refs/heads"
echo
echo "# Make changes"
echo "git log         # history master == local-branch"
echo "echo \"overwrite content\" > file.txt"
echo "git add file.txt"
echo "git commit -m\"Change content in local-brache\""
echo "git log         # show 'local-branch' history"
echo
echo "# Merge back to master"
echo "git checkout master"
echo "git log         # show log before 'merge'"
echo "git merge local-branch"
echo "git log         # show log after 'merge' - select HASH before HEAD"
echo
echo "# Revert merge and rebase back to master"
echo "export HASH=\$(git log -n2 --pretty=format:\"%H\" | tail -n1)"
echo "git reset \${HASH} --hard"
echo "git log         # show log before 'rebase'"
echo "git rebase local-branch"
echo "git log         # show log after 'rebase'"

echo
echo "# Master continued before merge or rebase"
echo "git reset \${HASH} --hard"
echo "touch file2.txt"
echo "git add file2.txt"
echo "git commit -m\"Added file.\" file2.txt"
echo "git log         # select the HEAD HASH"
echo
echo "export HASH=\$(git log -n1 --pretty=format:\"%H\" | tail -n1)"
echo "git merge local-branch"
echo "git log         # show log after 'merge'"
echo
echo "git reset \${HASH} --hard"
echo "git log         # show history before 'rebase'"
echo "git rebase local-branch"
echo "git log         # show history after 'rebase'"
echo "git checkout master"
