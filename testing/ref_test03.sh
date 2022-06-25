#!/bin/dash
 
PATH=$PATH:/Users/brono/GitHub/tigger

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'




echo "-------------WRONG USAGE & NO REPO------------"
2041 tigger-commit a b c ;echo "Exit status: $?"
2041 tigger-commit      ;echo "Exit status: $?"
echo ''


echo "-------------WRONG USAGE ------------"
ref_open_tigger
2041 tigger-commit a b c
2041 tigger-commit a a b c
close_tigger

echo "-------------EMPTY COMMIT------------"
ref_open_tigger
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
echo "[-a]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
close_tigger


echo "-------------PWD_ONLY------------"
ref_open_tigger
echo x > a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
echo "[-a]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger



echo "-------------INDEX_ONLY------------"
ref_open_tigger
echo x > a
2041 tigger-add a
rm -f a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
rm -f a
echo "[-a]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------IND_AND_PWD------------"
ref_open_tigger
echo x > a
2041 tigger-add a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
echo "[-a]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------DELTA_IND_PWD------------"
ref_open_tigger
echo x > a
2041 tigger-add a
echo xx > a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
echo xx > a
echo "[-a]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------REP_ONLY------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
2041 tigger-rm --cached a
rm -f a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
2041 tigger-rm --cached a
rm -f a
echo "[-a]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------REP_AND_PWD------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
2041 tigger-rm --cached a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
2041 tigger-rm --cached a
echo "[-a]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------DELTA_REP_PWD------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
2041 tigger-rm --cached a
echo xx > a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
2041 tigger-rm --cached a
echo xx > a
echo "[-a]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------REP_AND_IND------------"
ref_open_tigger
echo x > a
2041 tigger-add a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
echo "[no option]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------DELTA_REP_IND------------"
ref_open_tigger
echo x > a
2041 tigger-add a
echo xx > a
echo "[no option]"
print_pwd
2041 tigger-commit -m 'my first commit' ;echo "Exit status: $?"
print_pwd
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
echo xx > a
echo "[no option]"
print_pwd
2041 tigger-commit -am 'my first commit' ;echo "Exit status: $?"
print_pwd 
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------ALL_FOUND------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo "[no option]"
print_pwd 
2041 tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo "[-a]"
print_pwd 
2041 tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


#IND = REP
echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
echo "[no option]"
print_pwd 0
2041 tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
echo "[-a]"
print_pwd 0
2041 tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

#IND = PWD
echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
2041 tigger-add a
echo "[no option]"
print_pwd 0
2041 tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
2041 tigger-add a
echo "[-a]"
print_pwd 0
2041 tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


#REP = PWD
echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
2041 tigger-add a
echo x > a
echo "[no option]"
print_pwd 0
2041 tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
2041 tigger-add a
echo x > a
echo "[-a]"
print_pwd 0
2041 tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 0
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------ALL_DIFFERENT------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
2041 tigger-add a
echo xxx > a
echo "[no option]"
print_pwd 0
2041 tigger-commit -m 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger

ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 1>/dev/null
echo xx > a
2041 tigger-add a
echo xxx > a
echo "[-a]"
print_pwd 0
2041 tigger-commit -am 'my second commit' ;echo "Exit status: $?"
print_pwd 1
echo "log:"
2041 tigger-log 2>/dev/null
close_tigger


echo "-------------EMPTY COMMIT AFTER INITIAL COMMIT------------"
ref_open_tigger
echo x > a
2041 tigger-add a 
2041 tigger-commit -m 'first commit' 1>/dev/null

tigger-branch.sh b1 
tigger-checkout.sh b1

2041 tigger-rm a 
2041 tigger-commit -m 'first commit' 1>/dev/null

print_pwd
close_tigger
















































