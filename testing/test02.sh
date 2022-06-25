#!/bin/dash



. ./test_functions.sh


trap 'rm -fr -d a b c d e f g h i j k .tigger' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'


echo "-------------NO REPO------------"
tigger-add
echo "\n"


echo "-------------WRONG USAGE NO REPO------------"
tigger-add WRONG
echo "\n"


echo "-------------WRONG USAGE WITH REPO------------"
open_tigger
tigger-add WRONG
close_tigger



echo "-------------ADD ONE FILE------------"
open_tigger
echo x > a
tigger-add a 
print_pwd
close_tigger

echo "-------------ADD MULTIPLE FILES------------"
open_tigger
echo x |tee a b c 1>/dev/null
tigger-add a b c
print_pwd
close_tigger

echo "-------------ADD NON-REGULAR FILE------------"
open_tigger
mkdir  g
tigger-add g
print_pwd
close_tigger


echo "--------ADD MULTIPLE NON-REGULAR FILE------------"
open_tigger
mkdir k g
tigger-add k g
print_pwd
close_tigger


echo "-------------ADD REGULAR THEN NON-REGULAR FILE------------"
open_tigger
echo x |tee a b  1>/dev/null
mkdir k 
tigger-add a k b
print_pwd
close_tigger

echo "-------------ADD NON-REGULAR THEN REGULAR FILE------------"
open_tigger
echo x |tee a b  1>/dev/null
mkdir k 
tigger-add k a b
print_pwd
close_tigger

echo "-------------ADD FILES ALREADY ADDED------------"
open_tigger
echo x |tee a b  1>/dev/null
tigger-add a b
tigger-add a b
print_pwd
close_tigger

echo "-------------ADD SAME FILE AFTER EDITING------------"
open_tigger
echo x |tee a b  1>/dev/null
tigger-add a b
echo xx > b
tigger-add a b
print_pwd
close_tigger

echo "-------------ADD NON-EXISTENT FILE------------"
open_tigger
tigger-add a b
print_pwd
close_tigger

echo "-------------ADD tigger SOURCE FILE------------"
open_tigger
touch tigger-add tigger-init
tigger-add tigger-init
print_pwd
rm tigger-add tigger-init
close_tigger


echo "-------------ADD FILE THAT WAS REMOVED------------"
open_tigger
echo x |tee a b  1>/dev/null
tigger-add a b
tigger-rm.sh --cached b
print_pwd
tigger-add b
print_pwd
close_tigger


echo "-------------ADD DELETED FILE NO COMMIT------------"
open_tigger
echo x > a
tigger-add a 
rm -f a
print_pwd

tigger-add a
print_pwd
close_tigger










