#!/bin/bash
echo "# Setup dir as repo"
echo "mkdir praxis-0-graph"
echo "cd praxis-0-graph"
echo "git init"
echo "find . | grep -v hooks"
echo "git status"
echo "git checkout -b master"
echo
echo "# First git file"
echo "echo \"content\" > file.txt"
echo "git add file.txt"
echo "find .git/objects -type f"
echo "echo 'content' | git hash-object -w --stdin"
echo
echo "# Grep HASH"
echo "find .git/objects -type f | cut -d/ -f3,4- --output-delimiter="
echo "export HASH=\$(find .git/objects -type f | cut -d/ -f3,4- --output-delimiter= | head -n1)"
echo "git cat-file -p \${HASH}"
echo
echo "# Enable ZLIB as command"
echo "alias zlib=\"printf '\x1f\x8b\x08\x00\x00\x00\x00\x00' | cat - \""
echo "# Use ZLIB: 'zlib .git/objects/HA/SH...XYZ | gzip -dc'"
echo "zlib \$(find .git/objects -type f) | gzip -dc"
echo
echo "# Commit"
echo "git commit -m\"Initial commit\""

echo "# Grep HASH from git log"
echo "git log -n1"
echo "export HASH=\$(git log -n1 --pretty=format:\"%H\")"
echo "git cat-file -p \${HASH}"

echo
echo "# Change+commit"
echo "echo \"change\" > file.txt"
echo "git commit -a -m\"Second commit\""
echo "export HASH=\$(git log -n1 --pretty=format:\"%H\")"
echo "git cat-file -p \${HASH}"
