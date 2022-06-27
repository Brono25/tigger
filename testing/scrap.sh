#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


mkdir delete
cd delete

echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
ref_open_tigger


echo f > a

2041 tigger-add a
2041 tigger-commit -m 'X'
2041 tigger-rm  a;echo "Exit status: $?"

2041 tigger-rm --cached a;echo "Exit status: $?"

print_pwd




close_tigger

cd ..
rm -rf delete








mkdir delete
cd delete



echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
open_tigger





echo f > a

tigger-add a
tigger-commit -m 'X'
tigger-rm  a;echo "Exit status: $?"

tigger-rm  --cached a;echo "Exit status: $?"

print_pwd








close_tigger











cd ..
rm -rf delete




