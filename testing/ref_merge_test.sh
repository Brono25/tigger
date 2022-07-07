#!/bin/dash
 

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'




# echo "-------------WRONG USAGE & NO REPO------------"
# 2041 tigger-merge a b c ;echo "Exit status: $?"
# 2041 tigger-merge     ;echo "Exit status: $?"
# echo ''


# echo "-------------WRONG USAGE ------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m commit-1

# 2041 tigger-merge 
# 2041 tigger-merge b1
# 2041 tigger-merge b1 -m 
# 2041 tigger-merge b1 -ma m2 
# 2041 tigger-merge -m m3
# 2041 tigger-merge b1 -m m4 m5
# 2041 tigger-merge b1 b2 -m m4 m5

# close_tigger

# echo "-------------UNKOWN BRANCH------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m commit-1

# 2041 tigger-merge b1 -ma m1

# close_tigger


# echo "-------------MERGE BRANCH WITH ITSELF------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m commit-1

# 2041 tigger-merge master -m m1

# 2041 tigger-branch b1
# 2041 tigger-checkout b1

# 2041 tigger-merge b1 -m m1
# 2041 tigger-merge master -m m1



# touch b
# 2041 tigger-add b
# 2041 tigger-commit -m commit-2
# ref_print_all 0 1
# 2041 tigger-merge b1 -m m1
# 2041 tigger-merge master -m m1

# close_tigger


# echo "-------------MERGE BRANCH NO COMMITS------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m commit-1

# 2041 tigger-merge master -m m1

# 2041 tigger-branch b1
# 2041 tigger-checkout b1

# 2041 tigger-merge b1 -m m1

# 2041 tigger-merge master -m m1

# close_tigger



# echo "-------------FAST FORWARD MASTER------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m commit-0

# 2041 tigger-branch b1
# 2041 tigger-checkout b1

# 2041 tigger-merge master -m m1


# touch b  
# 2041 tigger-add b
# 2041 tigger-commit -m commit-1


# 2041 tigger-branch b2
# 2041 tigger-checkout b2
# touch c
# rm a b
# 2041 tigger-add a b c
# 2041 tigger-commit -m commit-2


# 2041 tigger-checkout master
# 2041 tigger-merge b1 -m m1

# ref_print_all 0 1 2 3 4




# close_tigger

# echo "-------------FAST FORWARD B1 TO MASTER------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m commit-0

# 2041 tigger-branch b2
# 2041 tigger-branch b1
# 2041 tigger-checkout b1


# touch b
# 2041 tigger-add b
# 2041 tigger-commit -m commit-1

# touch c
# rm a b
# 2041 tigger-add a b c
# 2041 tigger-commit -m commit-2


# touch d
# 2041 tigger-add d
# 2041 tigger-commit -m commit-3

# 2041 tigger-checkout b2




# touch e
# 2041 tigger-add e
# 2041 tigger-commit -m commit-4

# touch f
# 2041 tigger-add f
# 2041 tigger-commit -m commit-5


# ref_print_all 0 1 2 3 4 5


# 2041 tigger-checkout b1
# 2041 tigger-merge master -m m2
# 2041 tigger-checkout master
# ref_print_all 0 1 2 3 4 5

# # 2041 tigger-merge b1 -m m1

# close_tigger


echo "-------------FAST FORWARD MASTER TO B1------------"
ref_open_tigger
touch a 
2041 tigger-add a
2041 tigger-commit -m commit-0

2041 tigger-branch b2
2041 tigger-branch b1
2041 tigger-checkout b1


touch b
2041 tigger-add b
2041 tigger-commit -m commit-1

touch c
rm a b
2041 tigger-add a b c
2041 tigger-commit -m commit-2


touch d
2041 tigger-add d
2041 tigger-commit -m commit-3

2041 tigger-checkout b2




touch e
2041 tigger-add e
2041 tigger-commit -m commit-4

touch f
2041 tigger-add f
2041 tigger-commit -m commit-5


#ref_print_all 0 1 2 3 4 5


2041 tigger-checkout master
2041 tigger-merge b1 -m m2

ref_print_all 0 1 2 3 4 5
close_tigger

# echo "-------------MERGE------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m commit-0

# 2041 tigger-branch b1
# 2041 tigger-checkout b1

# 2041 tigger-merge master -m m1


# touch b  
# 2041 tigger-add b
# 2041 tigger-commit -m commit-1


# 2041 tigger-branch b2
# 2041 tigger-checkout b2
# touch c
# rm a b
# 2041 tigger-add a b c
# 2041 tigger-commit -m commit-2


# 2041 tigger-checkout b1


# touch d
# touch  b
# 2041 tigger-add a b d
# 2041 tigger-commit -m commit-3
# ref_print_all 0 1 2 3

# 2041 tigger-checkout b2
# 2041 tigger-merge b1 -m m1

# ref_print_all 0 1 2 3 4




# close_tigger






# echo "-------------INDEX_ONLY------------"



# echo "-------------IND_AND_PWD------------"



# echo "-------------DELTA_IND_PWD------------"


# echo "-------------REP_ONLY------------"


# echo "-------------REP_AND_PWD------------"


# echo "-------------DELTA_REP_PWD------------"


# echo "-------------REP_AND_IND------------"




# echo "-------------DELTA_REP_IND------------"


# echo "-------------ALL_SAME------------"



# #IND = REP
# echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"


# #IND = PWD
# echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"


# #REP = PWD
# echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"


# echo "-------------ALL_DIFFERENT------------"











































