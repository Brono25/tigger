#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh



[ -d "delete" ] && rm -rf delete


mkdir delete
cd delete
open_tigger
# #-----------------------------------




echo hello >a
tigger-add a
tigger-commit -m commit-A

tigger-branch branch1
tigger-checkout branch1

echo world >b
tigger-add b
tigger-commit -a -m commit-B

tigger-checkout master

tigger-branch -d branch1

tigger-merge branch1 -m merge-message

# tigger-branch -d branch1

tigger-branch


print_all 0 1 2 3 4







# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete






