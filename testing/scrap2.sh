#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


[ -d "delete" ] && rm -rf delete

mkdir delete
cd delete
ref_open_tigger
# #-----------------------------------




echo hello >a
2041 tigger-add a
2041 tigger-commit -m commit-A

2041 tigger-branch branch1
2041 tigger-checkout branch1

echo world >b
2041 tigger-add b
2041 tigger-commit -a -m commit-B

2041 tigger-checkout master

2041 tigger-branch -d branch1

2041 tigger-merge branch1 -m merge-message

2041 tigger-branch -d branch1

2041 tigger-branch

ref_print_all 0 1 2 3 4








# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete






