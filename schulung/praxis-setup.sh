#!/bin/bash
echo "export REPO_USER=\"\${USERNAME:-jwinter}\""
echo "export REPO_USER_MAIL=\"jan.winter@sstit.de\""
echo "export REPO_USER_NAME=\"Jan Winter\""
echo "export REPO=https://ibkgit02/SE/AFW/git.schulung.[kirk|spock|mccoy|scott|sulu|uhura|chekov]"
echo "export EDITOR=notepad.exe"
echo
echo "# Set git commit user+email"
echo "git config --global user.email \"\${REPO_USER_MAIL}\""
echo "git config --global user.name \"\${REPO_USER_NAME}\""
echo
echo "# Prevent TLS failor"
echo "git config --global http.sslVerify false"
echo
echo "# Set global pull strategy (default is merge)"
echo "git config --global pull.rebase true"
echo
echo "# Set interactive editor (default: vim)"
echo "git config --global core.editor \"\${EDITOR}\""
echo
echo "# Helper to cache PW"
echo "git config --global credential.\${REPO}.username \"\${REPO_USER}\""
echo "git config --global credential.helper store"
echo "git clone -n  \${REPO} # to force remote connection + PW typing"
echo "cat \${HOME}/.git-credentials"
