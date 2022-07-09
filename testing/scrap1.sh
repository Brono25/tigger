#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh



[ -d "delete" ] && rm -rf delete



mkdir delete
cd delete
ref_open_tigger
# #-----------------------------------



touch a
2041 tigger-add a
2041 tigger-commit -m commit-0

2041 tigger-branch branch1
2041 tigger-branch branch2
2041 tigger-branch master

2041 tigger-branch

2041 tigger-branch -d branch2

2041 tigger-branch -d master

2041 tigger-branch -d b1

2041 tigger-branch






# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete



mkdir delete
cd delete
open_tigger
# #-----------------------------------





touch a
tigger-add a
tigger-commit -m commit-0

tigger-branch branch1
tigger-branch branch2
tigger-branch master

tigger-branch

tigger-branch -d branch2

tigger-branch -d master

tigger-branch -d b1

# tigger-branch





# #-----------------------------------
# close_tigger
# echo ''
# cd ..
# rm -rf delete



