#!/bin/bash
echo "# Hotfix /master and cherry-pick /develop afterwards."
echo "git checkout v1.0"
echo
echo "git checkout -b hotfix/1.1"
echo "touch hotfix-1.1-change.txt"
echo "git add hotfix-1.1-change.txt"
echo "git commit -m hotfix-1.1-change.txt"
echo "git push origin hotfix/1.1"
echo
echo "# Create Merge-Request"
echo "# - open: \$(git config remote.origin.url | sed 's,\.git,,g')/merge_requests"
echo "# - create MR/PR (Merge-/ Pull-Request) 'hotfix/1.1' into 'master'"
echo "# - do merge ..."
echo
echo "# Tag master after successful merge"
echo "git checkout master"
echo "git pull"
echo "git tag v1.1"
echo "git push origin v1.1"
echo
echo "git log hotfix/1.1  # HEAD HASH ~ v1.1 tag"
echo
echo "git checkout develop"
echo "git pull"

echo "git cherry-pick v1.1"
echo "git push origin develop"
