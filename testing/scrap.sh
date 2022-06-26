#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger
#trap 'rm -rf .tigger' EXIT INT

[ -d  '.tigger' ] && rm -fr '.tigger'


# 2041 tigger-init

# 2041 tigger-commit -m ' commit 0'
# 2041 tigger-add  run_test.sh
# 2041 tigger-commit -m ' commit 1'
# 2041 tigger-commit -m ' commit 2'



# rm -fr '.tigger'

# echo ''

# tigger-init
# tigger-commit -m ' commit 0'
# tigger-add  run_test.sh
# tigger-commit -m ' commit 1'
# tigger-commit -m ' commit 2'

tigger-init

echo 1 > a
tigger-add a
tigger-commit -m message1


tigger-commit -m message2


# rm -fr 'a' 'b' '.tigger'



# 2041 tigger-init

# echo 1 > a
# 2041 tigger-add a
# 2041 tigger-commit -m message1

# touch a
# 2041 tigger-add a
# 2041 tigger-commit -m message2


# rm -fr 'a' 'b' '.tigger'