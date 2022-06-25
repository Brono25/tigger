#!/bin/dash



. ./test_functions.sh


trap 'rm -fr -d a b c d e f g h i j k .tigger' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'


echo "-------------NO REPO------------"
2041 tigger-add
echo "\n"


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
print_pwd
close_tigger

echo "-------------ADD MULTIPLE FILES------------"
ref_open_tigger
echo x |tee a b c 1>/dev/null
2041 tigger-add a b c
print_pwd
close_tigger

echo "-------------ADD NON-REGULAR FILE------------"
ref_open_tigger
mkdir  g
2041 tigger-add g
print_pwd
close_tigger


echo "--------ADD MULTIPLE NON-REGULAR FILE------------"
ref_open_tigger
mkdir k g
2041 tigger-add k g
print_pwd
close_tigger


echo "-------------ADD REGULAR THEN NON-REGULAR FILE------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
mkdir k 
2041 tigger-add a k b
print_pwd
close_tigger

echo "-------------ADD NON-REGULAR THEN REGULAR FILE------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
mkdir k 
2041 tigger-add k a b
print_pwd
close_tigger

echo "-------------ADD FILES ALREADY ADDED------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
2041 tigger-add a b
2041 tigger-add a b
print_pwd
close_tigger

echo "-------------ADD SAME FILE AFTER EDITING------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
2041 tigger-add a b
echo xx > b
2041 tigger-add a b
print_pwd
close_tigger

echo "-------------ADD NON-EXISTENT FILE------------"
ref_open_tigger
2041 tigger-add a b
print_pwd
close_tigger

echo "-------------ADD tigger SOURCE FILE------------"
ref_open_tigger
touch tigger-add tigger-init
2041 tigger-add tigger-init
print_pwd
rm tigger-add tigger-init
close_tigger


echo "-------------ADD FILE THAT WAS REMOVED------------"
ref_open_tigger
echo x |tee a b  1>/dev/null
2041 tigger-add a b
tigger-rm.sh --cached b
print_pwd
2041 tigger-add b
print_pwd
close_tigger


echo "-------------ADD DELETED FILE NO COMMIT------------"
ref_open_tigger
echo x > a
2041 tigger-add a 
rm -f a
print_pwd

2041 tigger-add a
print_pwd
close_tigger










