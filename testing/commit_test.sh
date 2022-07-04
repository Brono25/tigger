#!/bin/dash
 

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'




# echo "-------------WRONG USAGE & NO REPO------------"
# tigger-commit a b c ;echo "Exit status: $?"
# tigger-commit      ;echo "Exit status: $?"
# echo ''


# echo "-------------WRONG USAGE ------------"
# open_tigger
# tigger-commit a b c
# tigger-commit a a b c
# close_tigger

# echo "-------------EMPTY COMMIT------------"
# open_tigger
# echo "[no option]"
# print_pwd
# tigger-commit -m my first commit ;echo "Exit status: $?"
# echo "[-a]"
# print_pwd
# tigger-commit -am 'my first commit' ;echo "Exit status: $?"
# close_tigger


# echo "-------------PWD_ONLY------------"
# open_tigger
# echo x > a
# echo "[no option]"
# print_pwd
# tigger-commit -m 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger

# open_tigger
# echo x > a
# echo "[-a]"
# print_pwd
# tigger-commit -am 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger



# echo "-------------INDEX_ONLY------------"
# open_tigger
# echo x > a
# tigger-add a
# rm -f a
# echo "[no option]"
# print_pwd
# tigger-commit -m 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger

# open_tigger
# echo x > a
# tigger-add a
# rm -f a
# echo "[-a]"
# print_pwd
# tigger-commit -am 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger


# echo "-------------IND_AND_PWD------------"
# open_tigger
# echo x > a
# tigger-add a
# echo "[no option]"
# print_pwd
# tigger-commit -m 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger

# open_tigger
# echo x > a
# tigger-add a
# echo "[-a]"
# print_pwd
# tigger-commit -am 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger


# echo "-------------DELTA_IND_PWD------------"
# open_tigger
# echo x > a
# tigger-add a
# echo xx > a
# echo "[no option]"
# print_pwd
# tigger-commit -m 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger

# open_tigger
# echo x > a
# tigger-add a
# echo xx > a
# echo "[-a]"
# print_pwd
# tigger-commit -am 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger


# echo "-------------REP_ONLY------------"
# open_tigger
# echo x > a
# tigger-add a
# tigger-commit -m 'my first commit' 1>/dev/null
# tigger-rm --cached a
# rm -f a
# echo "[no option]"
# print_pwd
# tigger-commit -m 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger

# open_tigger
# echo x > a
# tigger-add a
# tigger-commit -m 'my first commit' 1>/dev/null
# tigger-rm --cached a
# rm -f a
# echo "[-a]"
# print_pwd
# tigger-commit -am 'my first commit' ;echo "Exit status: $?"
# print_pwd
# echo "log:"
# tigger-log 2>/dev/null
# close_tigger


echo "-------------REP_AND_PWD------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
tigger-rm --cached a
echo "[no option]"
print_pwd
tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
tigger-rm --cached a
echo "[-a]"
print_pwd
tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
tigger-log 2>/dev/null
close_tigger


echo "-------------DELTA_REP_PWD------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
tigger-rm --cached a
echo xx > a
echo "[no option]"
print_pwd
tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
tigger-rm --cached a
echo xx > a
echo "[-a]"
print_pwd
tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
tigger-log 2>/dev/null
close_tigger


echo "-------------REP_AND_IND------------"
open_tigger
echo x > a
tigger-add a
echo "[no option]"
print_pwd
tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
echo "[no option]"
print_pwd
tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
tigger-log 2>/dev/null
close_tigger


echo "-------------DELTA_REP_IND------------"
open_tigger
echo x > a
tigger-add a
echo xx > a
echo "[no option]"
print_pwd
tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
echo xx > a
echo "[no option]"
print_pwd
tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd 
echo "log:"
tigger-log 2>/dev/null
close_tigger


echo "-------------ALL_SAME------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo "[no option]"
print_pwd 
tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo "[-a]"
print_pwd 
tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 
echo "log:"
tigger-log 2>/dev/null
close_tigger


#IND = REP
echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
echo "[no option]"
print_pwd 0
tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
echo "[-a]"
print_pwd 0
tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
tigger-log 2>/dev/null
close_tigger

#IND = PWD
echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
tigger-add a
echo "[no option]"
print_pwd 0
tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
tigger-add a
echo "[-a]"
print_pwd 0
tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
tigger-log 2>/dev/null
close_tigger


#REP = PWD
echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
tigger-add a
echo x > a
echo "[no option]"
print_pwd 0
tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
tigger-add a
echo x > a
echo "[-a]"
print_pwd 0
tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 0
echo "log:"
tigger-log 2>/dev/null
close_tigger


echo "-------------ALL_DIFFERENT------------"
open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
tigger-add a
echo xxx > a
echo "[no option]"
print_pwd 0
tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
tigger-log 2>/dev/null
close_tigger

open_tigger
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
tigger-add a
echo xxx > a
echo "[-a]"
print_pwd 0
tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
tigger-log 2>/dev/null
close_tigger


# # echo "-------------EMPTY COMMIT AFTER INITIAL COMMIT------------"
# # open_tigger
# # echo x > a
# # tigger-add a 
# # tigger-commit -m 'first commit' 1>/dev/null

# # tigger-branch.sh b1 
# # tigger-checkout.sh b1

# # tigger-rm a 
# # tigger-commit -m 'first commit' 1>/dev/null

# # print_pwd
# # close_tigger
















































