#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


[ -d "delete" ] && rm -rf delete

mkdir delete
cd delete
ref_open_tigger
# #-----------------------------------




touch a b c
2041 tigger-add a
2041 tigger-commit -m commit-A

2041 tigger-branch b1
2041 tigger-checkout b1

touch d e
2041 tigger-rm a b

2041 tigger-commit -m commit-B
ref_print_all 0 1 2 
2041 tigger-checkout master



2041 tigger-branch b2
2041 tigger-checkout b2



touch f g
2041 tigger-rm b c



2041 tigger-add f g
2041 tigger-commit -m commit-C





2041 tigger-branch

2041 tigger-checkout b1

ref_print_all 0 1 2 3 4

# 2041 tigger-checkout master

# 2041 tigger-checkout b2

# 2041 tigger-checkout b1

# 2041 tigger-checkout master

# 2041 tigger-checkout b2

# 2041 tigger-checkout b1










# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete






