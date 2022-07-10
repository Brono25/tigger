#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh



[ -d "delete" ] && rm -rf delete



mkdir delete
cd delete
ref_open_tigger
# #-----------------------------------



#different names same content
echo "-------------RECOMMITTED EDITED FILE------------"
echo x > a
2041 tigger-add a 
2041 tigger-show :a
echo xx > a
2041 tigger-commit -m 'commit a edited'
2041 tigger-log
2041 tigger-show :a










# #-----------------------------------

echo ''
cd ..
rm -rf delete



mkdir delete
cd delete

# #-----------------------------------




tigger-init
tigger-log

# #-----------------------------------
# close_tigger
# echo ''
# cd ..
# rm -rf delete



