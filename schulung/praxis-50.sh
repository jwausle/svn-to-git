#!/bin/bash
echo "# Fort your repo."
echo "export REPO_USER=\"\${USERNAME:-jwinter}\""
echo "export REPO=\"https://ibkgit02/SE/AFW/git.schulung.[krit|spock|mccoy|scott|schulung|uhura|chekov]\""
echo "# maybe this? \$(git config remote.origin.url | sed 's,\.git,,g')"
echo "export FORKED_REPO=\"https://ibkgit02/\${REPO_USER}/git.schulung.[krit|spock|mccoy|scott|schulung|uhura|chekov]\""
echo
echo "cd .."
echo "git clone \${FORKED_REPO}"
echo "git config --local -l"
echo "git remote add upstream \${REPO}"
echo "git config --local -l | grep url"
echo
echo "# Commit "
echo "git checkout develop"
echo "git pull"
echo "git checkout -b my-fork-feature"
echo "git branch --set-upstream-to=upstream/develop develop # error expected"
echo "git config --local -l"
echo
echo "# Fetch from upstream and push to origin~fork"
echo "git pull upstream develop"
echo "git branch --set-upstream-to=upstream/develop develop"
echo
echo "Push changes to FORK"
echo "touch your-change.file"
echo "git add your-change.file"
echo "git commit -m\"Added your forked change\" your-change.file"
echo
echo "# ----------- wait for a change in upstream/develop"
echo
echo "git fetch upstream develop"
echo "git rebase upstream/develop"
echo "git log"
echo "git push origin my-fork-feature -f "

echo "# Create MR from origin/my-fork-feature to upstream/develop"
echo "# - do merge"
