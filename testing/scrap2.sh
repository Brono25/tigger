#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


[ -d "delete" ] && rm -rf delete

mkdir delete
cd delete
ref_open_tigger
# #-----------------------------------



seq 1 7 >7.txt
2041 tigger-add 7.txt
2041 tigger-commit -m commit-0

2041 tigger-branch b1
2041 tigger-checkout b1

perl -pi -e s/2/42/ 7.txt
2041 tigger-commit -a -m commit-1

2041 tigger-checkout master

perl -pi -e s/5/24/ 7.txt
2041 tigger-commit -a -m commit-2

2041 tigger-merge b1 -m merge-message


2041 tigger-log

2041 tigger-status











# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete



mkdir delete
cd delete
open_tigger
# #-----------------------------------



seq 1 7 >7.txt
tigger-add 7.txt
tigger-commit -m commit-0

tigger-branch b1
tigger-checkout b1

perl -pi -e s/2/42/ 7.txt
tigger-commit -a -m commit-1

tigger-checkout master

perl -pi -e s/5/24/ 7.txt
tigger-commit -a -m commit-2

tigger-merge b1 -m merge-message


tigger-log

tigger-status












# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete





