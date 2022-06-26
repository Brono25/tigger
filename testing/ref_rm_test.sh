#!/bin/dash


. ./test_functions.sh


trap 'rm -fr a b c d .tigger' EXIT INT

[ -d  '.tigger' ] && rm -rf '.tigger'




echo "-------------NO REPO------------"
2041 tigger-rm 
echo "\n"

echo "-------------WRONG USAGE NO REPO------------"
2041 tigger-rm -x
echo "\n"

echo "-------------WRONG USAGE WITH REPO------------"
ref_open_tigger
2041 tigger-rm -x word
close_tigger

echo "-------------NO FILE GIVEN------------"
ref_open_tigger
2041 tigger-rm --force           ;echo "Exit status: $?"
2041 tigger-rm --cached          ;echo "Exit status: $?"
2041 tigger-rm --force  --cached ;echo "Exit status: $?"
close_tigger


echo "-------------NONE_FOUND------------"
ref_open_tigger
2041 tigger-rm a b                  ;echo "Exit status: $?"
2041 tigger-rm --force a b          ;echo "Exit status: $?"
2041 tigger-rm --cached b a         ;echo "Exit status: $?"
2041 tigger-rm --force --cached a b ;echo "Exit status: $?"
close_tigger