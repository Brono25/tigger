#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


mkdir delete
cd delete



2041 tigger-init

echo line 1 > a
echo hello world > b
2041 tigger-add a b
2041 tigger-commit -m "first commit"

echo line 2 >> a
2041 tigger-add a
2041 tigger-commit -m "second commit"

2041 tigger-log

echo line 3 >> a
2041 tigger-add a
echo line 4 >> a
2041 tigger-show 0:a

2041 tigger-show 1:a

2041 tigger-show :a

2041 tigger-show 0:b

2041 tigger-show 1:b








echo ''

cd ..
rm -rf delete


mkdir delete
cd delete




tigger-init

echo line 1 > a
echo hello world > b
tigger-add a b
tigger-commit -m "first commit"

echo line 2 >> a
tigger-add a
tigger-commit -m "second commit"

tigger-log

echo line 3 >> a
tigger-add a
echo line 4 >> a
tigger-show 0:a

tigger-show 1:a

tigger-show :a

tigger-show 0:b

tigger-show 1:b





cd ..
rm -rf delete




