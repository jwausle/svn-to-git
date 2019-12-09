#!/bin/bash
echo "# Bugfix in /trunk and cherry-pick /master afterwards."
echo
echo "git checkout trunk"
echo "git pull"
echo
echo "git checkout -b bug/fix"
echo "touch bugfix-1.2-change.txt"
echo "git add bugfix-1.2-change.txt"
echo "git commit -m bugfix-1.2-change.txt"
echo "git push origin bug/fix"
echo
echo "- create Pull-Request 'bug/fix' into trunk'"
echo "- do merge"
echo
echo "git checkout trunk"
echo "git pull          # => after merging"
echo "git log           # select CHERRY-PICK-HASH"
echo "export CHERRY-PICK-HASH=\$(git log -n1 --pretty=format:\"%H\" | tail -n1)"
echo
echo "git checkout v1.1"
echo "git checkout -b hotfix/1.2"
echo "git cherry-pick \${CHERRY-PICK-HASH}"
echo
echo "# Create Merge-Request"
echo "# - create Pull-Request 'hotfix/1.2' into 'master'"
echo "# - do merge"
echo
echo "# Tag master after successful merge"
echo "git checkout master"
echo "git pull"
echo "git tag v1.2"
echo "git push origin v1.2"
