# Conflicts

Resolve conflicts while merging or rebasing with mergetool.

Scripts: `praxis-8-setup.sh`, `praxis-8.sh`

## Command list

```
# git config merge.tool meld
# git config diff.tool meld
# git config mergetool.meld.path /bin/meld
# git config -l | grep meld

# git checkout develop
# git branch -D left right
# git checkout -b left
# echo "left" > conflict.txt
# git add .
# git commit -m"Left"

# git checkout develop
# git checkout -b right
# echo "right" > conflict.txt
# git add .
# git commit -m"Right"

# git merge left
# cat conflict.txt
# git merge --abort

# git rebase left
# cat conflict.txt
# git rebase --abort

# git merge left -X theirs
# cat conflict.txt
# git reset --hard BEFORE_MERGE

# git merge left -X ours
# cat conflict.txt
# git reset --hard BEFORE_MERGE

# git rebase left -X theirs
# cat conflict.txt
# git reset --hard BEFORE_PREPARE && \
 echo "right" > conflict.txt && \
 git add . && \
 git commit -m"Right"

# git merge left
# git mergetool --tool=meld
# git merge --continue

# git reset --hard BEFORE_MERGE
# git merge left
# echo "new-value" > conflict.txt
# git add conflict.txt
# git commit -m"Merged" # fatal: cannot ...
# git commit -m"Merged" -i

# git reset --hard BEFORE_MERGE
# git rebase left
# git mergetool --tool=meld
# git rebase --continue
```

## Command list with output

```
##### SETUP
# git config merge.tool meld
# git config diff.tool meld
# git config mergetool.meld.path /Applications/Meld.app/Contents/MacOS/Meld
# git config -l | grep meld
mergetool.meld.path=/Applications/Meld.app/Contents/MacOS/Meld
diff.tool=meld
merge.tool=meld

###### PREPARE conflict left/right
# git branch -D left right
# git checkout -b left
# echo "left" > conflict.txt
# git add .
# git commit -m"Left"

# git checkout develop
# git checkout -b right
# echo "right" > conflict.txt
# git add .
# git commit -m"Right"

###### MERGE
# git merge left
Auto-merging conflict.txt
CONFLICT (add/add): Merge conflict in conflict.txt
Automatic merge failed; fix conflicts and then commit the result.
# cat conflict.txt
<<<<<<< HEAD
right
=======
left
>>>>>>> left
# git merge --abort

--------------------------------------
# git merge left -X ours
Merge made by the 'recursive' strategy.
# git right → cat conflict.txt
right

# git log # => select HASH before
# git reset --hard HASH

# git merge -X theirs
Auto-merging conflict.txt
Merge made by the 'recursive' strategy.
 conflict.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
# cat conflict.txt
left
#########################################

# git reset --hard BEFORE_MERGE
# git merge left
# git mergetool --tool=meld
Merging:
conflict.txt

Normal merge conflict for 'conflict.txt':
  {local}: created file
  {remote}: created file
/Applications/Meld.app/Contents/MacOS

# git commit -m"Merged" conflict.txt
fatal: cannot do a partial commit during a merge.
# git right* → git commit -i  -m"Merged" conflict.txt
[right 80d7519] Merged

# git reset --hard HASH
# git merge left

# => solve conflicts in editor
# git add conflict.txt
# git merge --continue
[right a092524] Merge branch 'left' into right

###### REBASE
# git rebase left
First, rewinding head to replay your work on top of it...
Applying: Right
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging conflict.txt
CONFLICT (add/add): Merge conflict in conflict.txt
error: Failed to merge in the changes.
Patch failed at 0001 Right
The copy of the patch that failed is found in: .git/rebase-apply/patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

# cat conflict.txt
<<<<<<< HEAD
left
=======
right
>>>>>>> Right

# git mergetool --tool=meld
Merging:
conflict.txt

Normal merge conflict for 'conflict.txt':
  {local}: created file
  {remote}: created file
/Applications/Meld.app/Contents/MacOS

# git rebase --continue
Applying: Right
# git  log

# git reset --hard 1b31f6d26ebbed79d4972ef8c4ef380d0751df84 && \
 echo "right" > conflict.txt && \
 git add . && \
 git commit -m"Right"
 ```
