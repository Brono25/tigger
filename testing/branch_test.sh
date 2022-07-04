#!/bin/dash
 


. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'




echo "-------------NO REPO---------"
tigger-branch
echo ''


echo "-------------BAD USAGE------------"
open_tigger
tigger-branch -dw wrong
tigger-branch -w wrong
tigger-branch -d wrong
tigger-branch
close_tigger

echo "-------------PRINT BRANCHES------------"
open_tigger
echo  "Branch List: "
tigger-branch
touch a b c
tigger-add a b
tigger-commit -m 'first commit'
tigger-branch b1
echo  "Branch List: "
tigger-branch
tigger-branch -d b1
echo  "Branch List: "
tigger-branch
close_tigger


echo "-------------CREATE BRANCH WITHOUT COMMITS------------"
open_tigger
tigger-branch b1  ;echo "Exit status: $?"
echo x > a
tigger-branch b2  ;echo "Exit status: $?"
tigger-add a 
tigger-branch b3  ;echo "Exit status: $?"

close_tigger

echo "-------------CREATE BRANCH WITHOUT NEW COMMITS------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 ;echo "Exit status: $?"

tigger-branch b2 ;echo "Exit status: $?"

tigger-branch    ;echo "Exit status: $?"
print_pwd
close_tigger

echo "-------------CREATE BRANCHS-----------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 b2 b3 b4

tigger-branch 
close_tigger


echo "-------------CREATE DUPLICATE MASTER------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch master ;echo "Exit status: $?"
tigger-branch ;echo "Exit status: $?"
close_tigger


echo "-------------CREATE DUPLICATE BRANCH------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 ;echo "Exit status: $?"
tigger-branch b1 ;echo "Exit status: $?"
tigger-branch    ;echo "Exit status: $?"
close_tigger

echo "-------------CHECK ORDER OF PRINTING------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 b3 b2 b4 ;echo "Exit status: $?"
tigger-branch             ;echo "Exit status: $?"
close_tigger



echo "-------------DELETE BRANCH------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 b3 b2 b4 ;echo "Exit status: $?"
tigger-branch 
tigger-branch -d b3 b4 ;echo "Exit status: $?"
tigger-branch 
close_tigger



# echo "-------------DELETE BRANCH YOURE ON------------"
# open_tigger
# echo x > a
# tigger-add a
# tigger-commit -m 'first commit' 1>/dev/null
# tigger-branch b1 
# tigger-checkout b1

# tigger-branch 
# tigger-branch -d b1
# tigger-branch 
# close_tigger


echo "-------------DELETE BRANCH YOURE ON IS MASTER------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch -d master
close_tigger


# echo "-------------DELETE MASTER WHILE ON B1------------"
# open_tigger
# echo x > a
# tigger-add a
# tigger-commit -m 'first commit' 1>/dev/null
# tigger-branch b1
# tigger-checkout b1
# tigger-branch -d master
# tigger-branch 
# close_tigger


# echo "-------------DO BRANCHES DELETE IF ONE ERRORS------------"
# open_tigger
# echo x > a
# tigger-add a
# tigger-commit -m 'first commit' 1>/dev/null

# tigger-branch b1 b2 b3 b4
# tigger-checkout b4
# tigger-branch 
# tigger-branch -d b1 x b2 b3
# tigger-branch 
# close_tigger



echo "-------------CREATE BRANCH WHEN UNSTAGED CHANGES------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
echo xx > a
tigger-branch b1 
tigger-branch 
close_tigger


