#!/bin/dash


. ./test_functions.sh


trap 'rm -fr a b c d .tigger' EXIT INT

[ -d  '.tigger' ] && rm -rf '.tigger'




echo "-------------NO REPO------------"
tigger-rm 
echo "\n"

echo "-------------WRONG USAGE NO REPO------------"
tigger-rm -x
echo "\n"

echo "-------------WRONG USAGE WITH REPO------------"
open_tigger
tigger-rm -x word
close_tigger

echo "-------------NO FILE GIVEN------------"
open_tigger
tigger-rm --force           ;echo "Exit status: $?"
tigger-rm --cached          ;echo "Exit status: $?"
tigger-rm --force  --cached ;echo "Exit status: $?"
close_tigger


echo "-------------NONE_FOUND------------"
open_tigger
tigger-rm a b                  ;echo "Exit status: $?"
tigger-rm --force a b          ;echo "Exit status: $?"
tigger-rm --cached b a         ;echo "Exit status: $?"
tigger-rm --force --cached a b ;echo "Exit status: $?"
close_tigger