#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh



[ -d "delete" ] && rm -rf delete



mkdir delete
cd delete
ref_open_tigger
# #-----------------------------------

echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 
echo xx > a
2041 tigger-commit -m 'my second commit' 
echo "Exit status: $?"
2041 tigger-log 

echo x > b
2041 tigger-add b
2041 tigger-commit -m 'my first commit' 
echo xx > b
2041 tigger-commit -am 'my second commit' 
echo "Exit status: $?"
2041 tigger-log 




# #-----------------------------------
close_tigger
echo ''
cd ..
rm -rf delete



mkdir delete
cd delete
open_tigger
# #-----------------------------------




echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
echo xx > a
tigger-commit -m 'my second commit' 
echo "Exit status: $?"
tigger-log 

echo x > b
tigger-add b
tigger-commit -m 'my first commit' 
echo xx > b
tigger-commit -am 'my second commit' 
echo "Exit status: $?"
tigger-log 






# #-----------------------------------
# close_tigger
# echo ''
# cd ..
# rm -rf delete



