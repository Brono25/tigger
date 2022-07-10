#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


[ -d "delete" ] && rm -rf delete

mkdir delete
cd delete

# #-----------------------------------


2041 tigger-init

echo 0 >level0
2041 tigger-add level0
2041 tigger-commit -m root

2041 tigger-branch b0
2041 tigger-branch b1
2041 tigger-checkout b0

echo 0 >level1
2041 tigger-add level1
2041 tigger-commit -m 0

2041 tigger-checkout b1

echo 1 >level1
2041 tigger-add level1
2041 tigger-commit -m 1

2041 tigger-checkout b0

2041 tigger-branch b00
2041 tigger-branch b01
2041 tigger-checkout b1

2041 tigger-branch b10
2041 tigger-branch b11
2041 tigger-checkout b00

echo 00 >level2
2041 tigger-add level2
2041 tigger-commit -m 00

2041 tigger-checkout b01

echo 01 >level2
2041 tigger-add level2
2041 tigger-commit -m 01

2041 tigger-checkout b10

echo 10 >level2
2041 tigger-add level2
2041 tigger-commit -m 10

2041 tigger-checkout b11

echo 11 >level2
2041 tigger-add level2
2041 tigger-commit -m 11

2041 tigger-checkout master

2041 tigger-log

2041 tigger-checkout b1

2041 tigger-log

2041 tigger-checkout b01

2041 tigger-log

2041 tigger-checkout b11

2041 tigger-log

2041 tigger-checkout master

2041 tigger-merge b0 -m merge0

2041 tigger-merge b00 -m merge00

2041 tigger-log






# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete

