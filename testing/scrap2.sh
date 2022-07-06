#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh




mkdir delete
cd delete
ref_open_tigger
# #-----------------------------------


#2041 tigger-init

touch a b c
2041 tigger-add a
2041 tigger-commit -m commit-A

2041 tigger-branch b1
2041 tigger-checkout b1

touch d e
2041 tigger-rm a b



2041 tigger-commit -m commit-B

2041 tigger-checkout master

2041 tigger-branch b2
2041 tigger-checkout b2




touch f g
2041 tigger-rm b c



2041 tigger-add f g

2041 tigger-commit -m commit-C
ref_print_all 0 1




2041 tigger-branch

2041 tigger-checkout b1

2041 tigger-checkout master

2041 tigger-checkout b2

2041 tigger-checkout b1

2041 tigger-checkout master

2041 tigger-checkout b2

2041 tigger-checkout b1

ref_print_all 0 1 2
# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete






