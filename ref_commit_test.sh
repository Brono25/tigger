#!/bin/dash
 
PATH=$PATH:/Users/brono/GitHub/tigger

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'






#IND = PWD
echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
ref_open_tigger
echo x > a
2041 tigger-add a
2041 tigger-commit -m 'my first commit' 
echo xx > a
2041 tigger-add a


2041 tigger-commit -m 'my second commit' ;echo "Exit status: $?"


2041 tigger-log 

echo x > b
2041 tigger-add b
2041 tigger-commit -m 'my first commit' 
echo xx > b
2041 tigger-add b


2041 tigger-commit -am 'my second commit' ;echo "Exit status: $?"

2041 tigger-log 
close_tigger


# #REP = PWD
# echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
# ref_open_tigger
# echo x > a
# 2041 tigger-add a
# 2041 tigger-commit -m 'my first commit' 
# echo xx > a
# 2041 tigger-add a
# echo x > a
# 
#  0
# 2041 tigger-commit -m 'my second commit' ;echo "Exit status: $?"
#  1
# 
# 2041 tigger-log 
# close_tigger

# ref_open_tigger
# echo x > a
# 2041 tigger-add a
# 2041 tigger-commit -m 'my first commit' 
# echo xx > a
# 2041 tigger-add a
# echo x > a
# 
#  0
# 2041 tigger-commit -am 'my second commit' ;echo "Exit status: $?"
#  0
# 
# 2041 tigger-log 
# close_tigger


# echo "-------------ALL_DIFFERENT------------"
# ref_open_tigger
# echo x > a
# 2041 tigger-add a
# 2041 tigger-commit -m 'my first commit' 
# echo xx > a
# 2041 tigger-add a
# echo xxx > a
# 
#  0
# 2041 tigger-commit -m 'my second commit' ;echo "Exit status: $?"
#  1
# 
# 2041 tigger-log 
# close_tigger

# ref_open_tigger
# echo x > a
# 2041 tigger-add a
# 2041 tigger-commit -m 'my first commit' 
# echo xx > a
# 2041 tigger-add a
# echo xxx > a
# 
#  0
# 2041 tigger-commit -am 'my second commit' ;echo "Exit status: $?"
#  1
# 
# 2041 tigger-log 
# close_tigger


# # # echo "-------------EMPTY COMMIT AFTER INITIAL COMMIT------------"
# # # ref_open_tigger
# # # echo x > a
# # # 2041 tigger-add a 
# # # 2041 tigger-commit -m 'first commit' 

# # # tigger-branch.sh b1 
# # # tigger-checkout.sh b1

# # # 2041 tigger-rm a 
# # # 2041 tigger-commit -m 'first commit' 

# # # 
# # # close_tigger
















































