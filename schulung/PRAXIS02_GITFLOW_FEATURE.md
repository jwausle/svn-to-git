# Praxis 2 Pull-Request for feature branch

Create a Your feature branch from master and do some changes there. To merge the changes create a Pull-Request on bitbucket web-ui and ask colleagues for comments and merging.

Scripts: `praxis-2-feature.sh`, `praxis-2-gitflow.sh`

# Praxis 2 command list

```
# git config pull.rebase true

# git checkout master
# git pull
# git checkout -b feature/YOUR_FEATURE_NAME
# touch any-file.txt
# git add any-file.txt
# git commit -m"Added any-file.txt" any-file.txt
# git log
commit 2db211e8065fc0590ae1c74a0a568d66da4a1c41 (HEAD -> feature/my-feature-branch)
Author: Jan Winter <jan.winter@itemis.de>
Date:   Sat Jan 20 19:28:44 2018 +0100

    Added any-file.txt

commit df1a23925548a7dd776111b577927f24083e57d2 (origin/master, master)
Author: Your Name <you@example.com>
Date:   Mon Dec 11 09:45:52 2017 +0100

    Updated README.md    

...

# git push origin feature/YOUR_FEATURE_NAME -f

# optional
# git branch --set-upstream-to=origin/feature/YOUR_FEATURE_NAME feature/YOUR_FEATURE_NAME
```

# Create Pull-Request on bitbucket web-ui

Open bitbucket in browser.
Open Pull-Request for feature/YOUR_FEATURE_NAME to master
Find another team to grant Your PR

GOAL: Get Your PR merged to master
