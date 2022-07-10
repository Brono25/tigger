#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh



[ -d "delete" ] && rm -rf delete



mkdir delete
cd delete

# #-----------------------------------

tigger-init

echo 0 >level0
tigger-add level0
tigger-commit -m root

tigger-branch b0
tigger-branch b1
tigger-checkout b0

echo 0 >level1
tigger-add level1
tigger-commit -m 0

tigger-checkout b1

echo 1 >level1
tigger-add level1
tigger-commit -m 1

tigger-checkout b0

tigger-branch b00
tigger-branch b01
tigger-checkout b1

tigger-branch b10
tigger-branch b11
tigger-checkout b00

echo 00 >level2
tigger-add level2
tigger-commit -m 00

tigger-checkout b01

echo 01 >level2
tigger-add level2
tigger-commit -m 01

tigger-checkout b10

echo 10 >level2
tigger-add level2
tigger-commit -m 10

tigger-checkout b11

echo 11 >level2
tigger-add level2
tigger-commit -m 11

tigger-checkout master

tigger-log

tigger-checkout b1

tigger-log

tigger-checkout b01

tigger-log

tigger-checkout b11

tigger-log

tigger-checkout master

tigger-merge b0 -m merge0

tigger-merge b00 -m merge00

tigger-log



#-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete



