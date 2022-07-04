#!/bin/dash
 


. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'




echo "-------------NO REPO---------"
2041 tigger-branch
echo ''


echo "-------------BAD USAGE------------"
ref_open_tigger
2041 tigger-branch -dw wrong
2041 tigger-branch -w wrong
2041 tigger-branch -d wrong
2041 tigger-branch
close_tigger

echo "-------------PRINT BRANCHES------------"
ref_open_tigger
echo  "Branch List: "
2041 tigger-branch
touch a b c
2041 tigger-add a b
2041 tigger-commit -m 'first commit'
2041 tigger-branch b1
echo  "Branch List: "
2041 tigger-branch
2041 tigger-branch -d b1
echo  "Branch List: "
2041 tigger-branch
close_tigger


echo "-------------CREATE BRANCH WITHOUT COMMITS------------"
ref_open_tigger
2041 tigger-branch b1  ;echo "Exit status: $?"
echo x > a
2041 tigger-branch b2  ;echo "Exit status: $?"
2041 tigger-add a 
2041 tigger-branch b3  ;echo "Exit status: $?"

close_tigger

echo "-------------CREATE BRANCH WITHOUT NEW COMMITS------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'first commit' 1>/dev/null
2041 tigger-branch b1 ;echo "Exit status: $?"

2041 tigger-branch b2 ;echo "Exit status: $?"

2041 tigger-branch    ;echo "Exit status: $?"
print_pwd
close_tigger




echo "-------------CREATE BRANCHS-----------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'first commit' 1>/dev/null
2041 tigger-branch b1 b2 b3 b4

2041 tigger-branch 
close_tigger


echo "-------------CREATE DUPLICATE MASTER------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'first commit' 1>/dev/null
2041 tigger-branch master ;echo "Exit status: $?"
2041 tigger-branch ;echo "Exit status: $?"
close_tigger


echo "-------------CREATE DUPLICATE BRANCH------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'first commit' 1>/dev/null
2041 tigger-branch b1 ;echo "Exit status: $?"
2041 tigger-branch b1 ;echo "Exit status: $?"
2041 tigger-branch    ;echo "Exit status: $?"
close_tigger

echo "-------------CHECK ORDER OF PRINTING------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'first commit' 1>/dev/null
2041 tigger-branch b1 b3 b2 b4 ;echo "Exit status: $?"
2041 tigger-branch             ;echo "Exit status: $?"
close_tigger



echo "-------------DELETE BRANCH------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'first commit' 1>/dev/null
2041 tigger-branch b1 b3 b2 b4 ;echo "Exit status: $?"
2041 tigger-branch 
2041 tigger-branch -d b3 b4 ;echo "Exit status: $?"
2041 tigger-branch 
close_tigger



# echo "-------------DELETE BRANCH YOURE ON------------"
# ref_open_tigger
# echo x > a
# 2041 tigger-add a
# 2041 tigger-commit -m 'first commit' 1>/dev/null
# 2041 tigger-branch b1 
# 2041 tigger-checkout b1

# 2041 tigger-branch 
# 2041 tigger-branch -d b1
# 2041 tigger-branch 
# close_tigger


echo "-------------DELETE BRANCH YOURE ON IS MASTER------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'first commit' 1>/dev/null
2041 tigger-branch -d master
close_tigger


# echo "-------------DELETE MASTER WHILE ON B1------------"
# ref_open_tigger
# echo x > a
# 2041 tigger-add a
# 2041 tigger-commit -m 'first commit' 1>/dev/null
# 2041 tigger-branch b1
# 2041 tigger-checkout b1
# 2041 tigger-branch -d master
# 2041 tigger-branch 
# close_tigger


# echo "-------------DO BRANCHES DELETE IF ONE ERRORS------------"
# ref_open_tigger
# echo x > a
# 2041 tigger-add a
# 2041 tigger-commit -m 'first commit' 1>/dev/null

# 2041 tigger-branch b1 b2 b3 b4
# 2041 tigger-checkout b4
# 2041 tigger-branch 
# 2041 tigger-branch -d b1 x b2 b3
# 2041 tigger-branch 
# close_tigger



echo "-------------CREATE BRANCH WHEN UNSTAGED CHANGES------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'first commit' 1>/dev/null
echo xx > a
2041 tigger-branch b1 
2041 tigger-branch 
close_tigger


