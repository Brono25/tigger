#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh



[ -d "delete" ] && rm -rf delete


mkdir delete
cd delete
open_tigger
# #-----------------------------------


touch a b c
tigger-add a
tigger-commit -m commit-A

tigger-branch b1
tigger-checkout b1

touch d e
tigger-rm a b

tigger-commit -m commit-B

print_all 0 1 2 

tigger-checkout master



tigger-branch b2
tigger-checkout b2



touch f g
tigger-rm b c



tigger-add f g
tigger-commit -m commit-C



tigger-branch

tigger-checkout b1

print_all 0 1 2 3 4

# tigger-checkout master

# tigger-checkout b2

# tigger-checkout b1

# tigger-checkout master

# tigger-checkout b2

# tigger-checkout b1







# #-----------------------------------
# close_tigger
# echo ''
# cd ..
# rm -rf delete






