#!/bin/dash

. ./test_functions.sh

mkdir del
cd del





echo "-------------NO REPO---------"
2041 tigger-status ;echo "$?"
echo ''

echo "-------------NO_FILES---------"
ref_open_tigger
2041 tigger-status; echo "$?"
close_tigger


echo "-------------BAD USAGE------------"
ref_open_tigger
2041 tigger-status wrong
close_tigger

echo "-------------UNTRACKED------------"
ref_open_tigger
touch a
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------SAME_AS_REPO------------"
ref_open_tigger
touch a
2041 tigger-add a  
2041 tigger-commit -m 'commit a' 1> /dev/null
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------FILE_DELETED------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
rm -f a
2041 tigger-status ;echo "$?"
close_tigger



echo "-------------DELETED------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
2041 tigger-rm a
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------ADDED_TO_INDEX------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------DIFF_CHANGES_STAGED------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
echo x > a
2041 tigger-add a 
echo xx > a
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------CHANGES_STAGED------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
echo x > a
2041 tigger-add a 
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------CHANGES_NOT_STAGED------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
echo x > a
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------INDEX_ONLY------------"
ref_open_tigger
touch a
2041 tigger-add a 
rm -f a
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------DELTA_IND_PWD------------"
ref_open_tigger
touch a
2041 tigger-add a 
echo x > a
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------REP_AND_PWD------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
2041 tigger-rm --force --cached a
2041 tigger-status ;echo "$?"
close_tigger

echo "-------------DELTA_REP_PWD------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
2041 tigger-rm --force --cached a
echo x > a
2041 tigger-status ;echo "$?"
close_tigger


echo "-------------DELTA_REP_IND------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
echo x > a
2041 tigger-add a 
rm -f a
2041 tigger-status ;echo "$?"
close_tigger

echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
ref_open_tigger
touch a
2041 tigger-add a 
2041 tigger-commit -m 'commit a' 1> /dev/null
echo x > a
2041 tigger-add a 
rm -f a
touch a
2041 tigger-status ;echo "$?"
close_tigger



echo "-------------MULTIPLE STATUS------------"
ref_open_tigger
touch  f x g y h z i s u p o t l r
2041 tigger-add  f x g y h z i s t l r
2041 tigger-commit -m 'first commit' 1> /dev/null
2041 tigger-rm --cached r
touch  e j k
echo x > f; echo x > x; echo x > h; echo x > z; echo x > i;  echo x > s
2041 tigger-add  e j k f x h z i s

rm -f h z l
echo x > g
echo x > y
echo x > j
echo x > k
echo xx > i
echo xx > s
touch h z
2041 tigger-status ;echo "$?"

close_tigger


cd ..
rm -rf del
