#!/bin/bash
echo "export YOUR_FEATURE_NAME=gitflow-feature"
echo
echo "git config pull.rebase true # ensure that default pull merge strategy is rebase"
echo
# Develop a feature
echo "git checkout trunk"
echo "git pull         # => be always in sync with origin"
echo "git checkout -b feature/\${YOUR_FEATURE_NAME}"
echo "touch gitflow-feature-change.txt"
echo "git add gitflow-feature-change.txt"
echo "git commit -m\"Added giflow feature\" gitflow-feature-change.txt"
echo "git log"
echo "git push origin feature/\${YOUR_FEATURE_NAME}"
echo
echo "# Creat Merge-Request"
echo "- open: \$(git config remote.origin.url | sed 's,\.git,,g')/merge_requests"
echo "- create MR/PR (Merge-/ Pull-Request)"
