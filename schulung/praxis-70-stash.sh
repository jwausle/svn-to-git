#!/bin/bash
echo "git checkout develop"
echo "git pull "
echo "# Remember for current HEAD before stashing."
echo "export HASH=\$(git log -n1 --pretty=format:\"%H\" | tail -n1)"
echo
echo "# Create a new /tmp/branch"
echo "git checkout -b tmp/branch"
echo
echo "# Continue development in /develop to prepare stash problem"
echo "git checkout develop"
echo "echo \"before stash\" > another.file"
echo "git add another.file"
echo "git commit -m\"Before stash\" another.file"
echo
echo "# Run into stashing problem during touching the same file."
echo "git checkout tmp/branch"
echo "touch another.file"
echo "git checkout develop"
echo "error: The following untracked working ... # Expected failor"
echo
echo "git status"
echo "git stash save       # cache untracked files too"
echo
echo "git checkout develop"
echo "git reset ${HASH} --hard  # reset to origin/develop/HEAD"
echo "git status                # already up-to-date"
echo
echo "# Pop changes from stash stack"
echo "git checkout tmp/branch"
echo "git stash pop"
echo "ls another.file        # loaded file from stash"
