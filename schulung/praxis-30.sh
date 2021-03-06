#!/bin/bash
echo "export RELEASE=1.0"
echo "git checkout develop"
echo "git pull                # => be always in sync with origin"
echo "git log                 # check that features is in develop"
echo
echo "# Prepare Release == feature-freeze"
echo "git checkout -b release/\${RELEASE}"
echo "echo \"CHANGE_LOG.md\" > CHANGE_LOG.md"
echo "git add CHANGE_LOG.md"
echo "git commit -m\"Added CHANGE_LOG.\" CHANGE_LOG.md"
echo "git push origin release/1.0"
echo
echo "# Create Merge-Request"
echo "- open: \$(git config remote.origin.url | sed 's,\.git,,g')/merge_requests"
echo "- create MR/PR (Merge-/ Pull-Request) 'release/1.0' into 'master'"
echo
echo "# Release"
echo "git checkout master"
echo "git pull"
echo "git log                  # check feature is in master"
echo
echo "git tag v\${RELEASE}"
echo "git push origin v\${RELEASE}  # push tag"

# Re-integrate release commits into develop
echo "git checkout develop"
echo "git pull                # => be always in sync with origin"
echo "git merge master"
echo "git push origin develop"
