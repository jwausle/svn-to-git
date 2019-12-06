echo "# Sync with remote REPO"
echo "export REPO=\"https://ibkgit02/SE/AFW/git.schulung.[kirk|spock|mccoy|scott|sulu|uhura|chekov].git\""
echo
echo "# Setup dir as repo"
echo "mkdir praxis-1"
echo "cd praxis-1"
echo "git init"
echo "find . | grep -v hooks"
echo "git status"
echo "git checkout -b master"
echo
echo "# Add file to index"
echo "echo \"Content\" > afile.txt"
echo "git status"
echo "git add afile.txt"
echo "git status"
echo
echo "# Commit file"
echo "git commit -m\"First Commit.\" afile.txt"
echo "git status"
echo "git log -n1"
echo
echo "# Connect with remote repo"
echo "git fetch     # => expected fatal: No remote ..."
echo "git remote add origin ${REPO}"
echo "git config -l"
echo
echo "git branch -a"
echo "git fetch"
echo "git branch -a"
echo
echo "git log -n10 remotes/origin/trunk"
echo "git log -n1 origin/master"
echo
echo "# Synchronize master and trunk"
echo "git merge trunk"
echo "git checkout trunk"
echo "git merge master --ff-only"
echo "git push origin trunk master"
echo
echo "# Bind local master to remote master"
echo "git branch --set-upstream-to=origin/master master"
echo "git config -l --local"
