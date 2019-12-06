#!/bin/bash
echo "# Setup dir as repo"
echo "mkdir praxis-0-add"
echo "cd praxis-0-add"
echo "git init"
echo "find . | grep -v hooks"
echo "git status"
echo "git checkout -b master"

echo "# Add file to index"
echo "echo \"content\" > file.txt"
echo "git add file.txt"        # stage a file =>1 object
echo "git status     # => file ready for commit"

echo "# Remove file (soft)"
echo "git rm text.file --cached"
echo "ls             # file still exist"
echo "git status     # => file ready for add"

echo "# Remove file (hard)"
echo "git add file.txt"
echo "git rm file.txt -f"
echo "ls             # => show nothing: file was deleted"

echo "# Move file"
echo "touch file.txt"
echo "git mv file.txt moved-text.file # -> fatal:..."
echo "git add file.txt"
echo "git mv file.txt moved-text.file"
echo "ls             # => show moved-text.file"
echo "git commit -m\"Moved after add\" moved-text.file"

echo "# Remove commited file"
echo "git rm moved-text.file"
echo "ls"
echo "git status     # => show deleted file im index"
