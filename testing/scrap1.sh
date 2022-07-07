#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh



[ -d "delete" ] && rm -rf delete


mkdir delete
cd delete
open_tigger
# #-----------------------------------

touch a b z
tigger-add a b
tigger-commit -m commit-0

touch k l 
tigger-add k l
tigger-commit -m commit-00


tigger-branch b1
tigger-checkout b1
touch c d
tigger-add c d
tigger-rm a b 
tigger-commit -m commit-1

touch e f
tigger-add e f
tigger-commit -m commit-3


touch f g
tigger-add f g
tigger-commit -m commit-4


tigger-checkout master
print_all 0 1

touch v g
tigger-add v g
tigger-commit -m commit-4



tigger-merge b1 -m m1








# #-----------------------------------
# close_tigger
# echo ''
# cd ..
# rm -rf delete






