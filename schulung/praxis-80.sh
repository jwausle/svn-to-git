#!/bin/bash
echo "# Prepare branches /left and /right"
echo "bash ./schulung/praxis-8-setup.sh.sh"
echo
echo "# Merge left into right and abort"
echo "git merge left"
echo "cat conflict.txt"
echo "git merge --abort"
echo
echo "# Rebase right onto left and abort"
echo "git rebase left"
echo "cat conflict.txt"
echo "git rebase --abort"
echo
echo "bash ./schulung/praxis-8-setup.sh.sh"
echo
echo "# Merge-ours where /right wins."
echo "git merge left -X ours"
echo "cat conflict.txt"
echo
echo "bash ./schulung/praxis-8-setup.sh.sh"
echo
echo "# Rebase-ours where /left wins."
echo "git rebase left -X ours"
echo "cat conflict.txt"
