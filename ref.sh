#!/bin/dash
# ==============================================================================
# test01.sh
# Testing 2041 tigger-add
#
# 
# ==============================================================================


PATH="$PATH:$(pwd)"

. ./test_functions.sh

[ -d 'tmp' ] && rm -rf 'tmp'

output="$(mktemp)"
expected_output="$(mktemp)"


trap 'rm -f $output $expected_output' EXIT INT




echo "-------------WRONG USAGE NO REPO------------"
2041 tigger-add WRONG
echo "\n"


echo "-------------WRONG USAGE WITH REPO------------"
ref_open_tigger
2041 tigger-add WRONG
close_tigger



echo "-------------ADD ONE FILE------------"
ref_open_tigger
echo x > a
2041 tigger-add a 

close_tigger

echo "-------------ADD MULTIPLE FILES------------"
ref_open_tigger
echo x |tee a b c 1>/dev/null
2041 tigger-add a b c

close_tigger

echo "-------------ADD NON-REGULAR FILE------------"
ref_open_tigger
mkdir  g
2041 tigger-add g

close_tigger


echo "--------ADD MULTIPLE NON-REGULAR FILE------------"
ref_open_tigger
mkdir k g
2041 tigger-add k g

close_tigger


echo "-------------ADD REGULAR THEN NON-REGULAR FILE------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
mkdir k 
2041 tigger-add a k b

close_tigger

echo "-------------ADD NON-REGULAR THEN REGULAR FILE------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
mkdir k 
2041 tigger-add k a b

close_tigger

echo "-------------ADD FILES ALREADY ADDED------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
2041 tigger-add a b
2041 tigger-add a b

close_tigger

echo "-------------ADD SAME FILE AFTER EDITING------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
2041 tigger-add a b
echo xx > b
2041 tigger-add a b

close_tigger

echo "-------------ADD NON-EXISTENT FILE------------"
ref_open_tigger
2041 tigger-add a b

close_tigger



echo "-------------ADD FILE THAT WAS REMOVED------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
2041 tigger-add a b
2041 tigger-rm --cached b

2041 tigger-add b

close_tigger


echo "-------------ADD DELETED FILE NO COMMIT------------"
ref_open_tigger
echo x > a
2041 tigger-add a 
rm -f a


2041 tigger-add a

close_tigger




echo "-------------PWD_ONLY------------"
ref_open_tigger
touch a b
2041 tigger-add a b
close_tigger



echo "-------------INDEX_ONLY------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-show :a
rm a 
2041 tigger-show :a
2041 tigger-add a 
2041 tigger-show :a



close_tigger

echo "-------------IND_AND_PWD------------"

ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-show :a
2041 tigger-add a 




close_tigger




echo "-------------DELTA_IND_PWD------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-show :a
echo "file a edited" > a
2041 tigger-add a 
2041 tigger-show :a



close_tigger



echo "-------------REP_ONLY------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
2041 tigger-rm a

2041 tigger-add a 
2041 tigger-show :a



close_tigger



echo "-------------REP_AND_PWD------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
2041 tigger-rm --cached a

2041 tigger-add a 
2041 tigger-show :a



close_tigger



echo "-------------DELTA_REP_PWD------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
2041 tigger-rm --cached a
echo "file a edited" > a
2041 tigger-add a 
2041 tigger-show :a



close_tigger


echo "-------------REP_AND_IND------------"

ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
rm a

2041 tigger-add a 
2041 tigger-show :a



close_tigger


echo "-------------DELTA_REP_IND------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
echo "file a edited" > a
2041 tigger-add a 
rm a 


2041 tigger-add a 
2041 tigger-show :a



close_tigger


echo "-------------ALL_SAME------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'

2041 tigger-add a 


2041 tigger-show :a



close_tigger


#IND = REP
echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
echo "file a edited" > a


2041 tigger-add a 
2041 tigger-show :a



close_tigger




#IND = PWD
echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
echo "file a edited" > a
2041 tigger-add a 


2041 tigger-add a 
2041 tigger-show :a



close_tigger


#REP = PWD
echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
echo "file a edited" > a
2041 tigger-add a 
echo "file a" > a

2041 tigger-add a 
2041 tigger-show :a



close_tigger


echo "-------------ALL_DIFFERENT------------"

ref_open_tigger
echo "file a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit 0'
echo "file a edited" > a
2041 tigger-add a 
echo "file a 2nd edit" > a

2041 tigger-add a 
2041 tigger-show :a



close_tigger
















cd ..
rm -fr 'tmp'

















