#!/bin/dash

. ./test_functions.sh

mkdir del
cd del





echo "-------------NO REPO---------"
tigger-status ;echo "$?"
echo ''

echo "-------------NO_FILES---------"
open_tigger
tigger-status; echo "$?"
close_tigger


echo "-------------BAD USAGE------------"
open_tigger
tigger-status wrong
close_tigger

echo "-------------UNTRACKED------------"
open_tigger
touch a
tigger-status ;echo "$?"
close_tigger


echo "-------------SAME_AS_REPO------------"
open_tigger
touch a
tigger-add a  
tigger-commit -m 'commit a' 1> /dev/null
tigger-status ;echo "$?"
close_tigger


echo "-------------FILE_DELETED------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
rm -f a
tigger-status ;echo "$?"
close_tigger



echo "-------------DELETED------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
tigger-rm a
tigger-status ;echo "$?"
close_tigger


echo "-------------ADDED_TO_INDEX------------"
open_tigger
touch a
tigger-add a 
tigger-status ;echo "$?"
close_tigger


echo "-------------DIFF_CHANGES_STAGED------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
echo x > a
tigger-add a 
echo xx > a
tigger-status ;echo "$?"
close_tigger


echo "-------------CHANGES_STAGED------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
echo x > a
tigger-add a 
tigger-status ;echo "$?"
close_tigger


echo "-------------CHANGES_NOT_STAGED------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
echo x > a
tigger-status ;echo "$?"
close_tigger


echo "-------------INDEX_ONLY------------"
open_tigger
touch a
tigger-add a 
rm -f a
tigger-status ;echo "$?"
close_tigger


echo "-------------DELTA_IND_PWD------------"
open_tigger
touch a
tigger-add a 
echo x > a
tigger-status ;echo "$?"
close_tigger


echo "-------------REP_AND_PWD------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
tigger-rm --force --cached a
tigger-status ;echo "$?"
close_tigger

echo "-------------DELTA_REP_PWD------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
tigger-rm --force --cached a
echo x > a
tigger-status ;echo "$?"
close_tigger


echo "-------------DELTA_REP_IND------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
echo x > a
tigger-add a 
rm -f a
tigger-status ;echo "$?"
close_tigger

echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
open_tigger
touch a
tigger-add a 
tigger-commit -m 'commit a' 1> /dev/null
echo x > a
tigger-add a 
rm -f a
touch a
tigger-status ;echo "$?"
close_tigger



echo "-------------MULTIPLE STATUS------------"
open_tigger
touch  f x g y h z i s u p o t l r
tigger-add  f x g y h z i s t l r
tigger-commit -m 'first commit' 1> /dev/null
tigger-rm --cached r
touch  e j k
echo x > f; echo x > x; echo x > h; echo x > z; echo x > i;  echo x > s
tigger-add  e j k f x h z i s

rm -f h z l
echo x > g
echo x > y
echo x > j
echo x > k
echo xx > i
echo xx > s
touch h z
tigger-status ;echo "$?"

close_tigger


cd ..
rm -rf del
