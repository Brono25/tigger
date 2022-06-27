#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


mkdir delete
cd delete



cd ..
rm -rf delete


echo "-------------MULTIPLE FILES ERROR ORDER-[--cached]------------"
open_tigger
touch g 
tigger-add g 
tigger-commit -m 'first commit' 1>/dev/null


echo x > g



print_pwd;  
tigger-rm --cached g  ;echo "Exit status: $?"
print_pwd;  
close_tigger







mkdir delete
cd delete



echo "-------------MULTIPLE FILES ERROR ORDER-[--cached]------------"
ref_open_tigger
touch g 
2041 tigger-add g 
2041 tigger-commit -m 'first commit' 1>/dev/null





echo x > g



print_pwd;  
2041 tigger-rm --cached g    ;echo "Exit status: $?"
print_pwd;  
close_tigger




echo "-------------MULTIPLE FILES ERROR ORDER-[--cached]------------"
ref_open_tigger
touch g 
git add g 
git commit -m 'first commit' 1>/dev/null





echo x > g



print_pwd;  
git rm --cached g    ;echo "Exit status: $?"
print_pwd;  
close_tigger








cd ..
rm -rf delete




