#!/bin/bash
echo "export YOUR_FEATURE_NAME=first-feature"
echo
echo "git config pull.rebase true # ensure that default pull merge strategy is rebase"
echo
# Develop a feature
echo "git checkout master"
echo "git pull         # => be always in sync with origin"
echo "git checkout -b feature/\${YOUR_FEATURE_NAME}"
echo "touch any-file.txt"
echo "git add any-file.txt"
echo "git commit -m\"Added any-file.txt\" any-file.txt"
echo "git log"
echo "git push origin feature/\${YOUR_FEATURE_NAME}"
echo
echo "# Merge the feature (old way)"
echo "git checkout master "
echo "git pull"
echo "git merge feature/\${YOUR_FEATURE_NAME}"
echo
echo "# SKIP git push origin master - use Merge-Request instead"
echo "- open: \$(git config remote.origin.url | sed 's,\.git,,g')/merge_requests"
echo "- create MR/PR (Merge-/ Pull-Request)"
