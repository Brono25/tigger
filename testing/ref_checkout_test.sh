#!/bin/dash
 
PATH=$PATH:/Users/brono/GitHub/tigger

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'


mkdir del
cd del

# echo "-------------WRONG USAGE & NO REPO------------"
# 2041 tigger-checkout a b c ;echo "Exit status: $?"
# 2041 tigger-checkout     ;echo "Exit status: $?"
# echo ''


# echo "-------------WRONG USAGE NO COMMIT ------------"
# ref_open_tigger
# 2041 tigger-checkout a b c ;echo "Exit status: $?"
# 2041 tigger-checkout       ;echo "Exit status: $?"
# close_tigger

# echo "-------------WRONG USAGE WITH COMMIT------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m 'a'

# 2041 tigger-checkout 
# 2041 tigger-checkout  1 2
# close_tigger


# echo "-------------CHECKOUT UNKNOWN BRANCH------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m 'a'



# 2041 tigger-checkout b1
# close_tigger




echo "-------------PWD_ONLY------------"
ref_open_tigger
touch a 
2041 tigger-add a
2041 tigger-commit -m 'a' 1>/dev/null


touch b
2041 tigger-branch b1
2041 tigger-checkout b1
rm b
2041 tigger-add b
2041 tigger-commit -m 'b1 commit'
2041 tigger-checkout master


close_tigger


# echo "-------------INDEX_ONLY------------"
# ref_open_tigger




# close_tigger


# echo "-------------IND_AND_PWD------------"
# ref_open_tigger




# close_tigger


# echo "-------------DELTA_IND_PWD------------"
# ref_open_tigger




# close_tigger


# echo "-------------REP_ONLY------------"
# ref_open_tigger




# close_tigger


# echo "-------------REP_AND_PWD------------"
# ref_open_tigger




# close_tigger


# echo "-------------DELTA_REP_PWD------------"
# ref_open_tigger




# close_tigger


# echo "-------------REP_AND_IND------------"
# ref_open_tigger




# close_tigger


# echo "-------------DELTA_REP_IND------------"
# ref_open_tigger




# close_tigger


# echo "-------------ALL_SAME------------"
# ref_open_tigger




# close_tigger

# #IND = REP
# echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
# ref_open_tigger




# close_tigger

# #IND = PWD
# echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
# ref_open_tigger




# close_tigger


# #REP = PWD
# echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
# ref_open_tigger




# close_tigger


# echo "-------------ALL_DIFFERENT------------"
# ref_open_tigger




# close_tigger







cd ..
rm -fr del







































