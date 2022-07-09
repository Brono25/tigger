#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh



[ -d "delete" ] && rm -rf delete



mkdir delete
cd delete
ref_open_tigger
# #-----------------------------------



seq -f "line %.0f" 1 7 >a
seq -f "line %.0f" 1 7 >b
seq -f "line %.0f" 1 7 >c
seq -f "line %.0f" 1 7 >d
2041 tigger-add a b c d
2041 tigger-commit -m commit-0

2041 tigger-branch b1
2041 tigger-checkout b1

seq -f "line %.0f" 0 7 >a
seq -f "line %.0f" 1 8 >b
seq -f "line %.0f" 1 7 >e
2041 tigger-add e
2041 tigger-commit -a -m commit-1

2041 tigger-checkout master

sed -i 4d c
seq -f "line %.0f" 0 8 >d
seq -f "line %.0f" 1 7 >f
2041 tigger-add f
2041 tigger-commit -a -m commit-2

2041 tigger-merge b1 -m merge1

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


seq -f "line %.0f" 1 7 >a
seq -f "line %.0f" 1 7 >b
seq -f "line %.0f" 1 7 >c
seq -f "line %.0f" 1 7 >d
tigger-add a b c d
tigger-commit -m commit-0

tigger-branch b1
tigger-checkout b1

seq -f "line %.0f" 0 7 >a
seq -f "line %.0f" 1 8 >b
seq -f "line %.0f" 1 7 >e
tigger-add e
tigger-commit -a -m commit-1

tigger-checkout master

sed -i 4d c
seq -f "line %.0f" 0 8 >d
seq -f "line %.0f" 1 7 >f
tigger-add f
tigger-commit -a -m commit-2

tigger-merge b1 -m merge1

tigger-log

tigger-status






# #-----------------------------------
# close_tigger
# echo ''
# cd ..
# rm -rf delete



