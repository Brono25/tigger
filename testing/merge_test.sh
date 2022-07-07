#!/bin/dash
 

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'




# echo "-------------WRONG USAGE & NO REPO------------"
# tigger-merge a b c ;echo "Exit status: $?"
# tigger-merge     ;echo "Exit status: $?"
# echo ''


# echo "-------------WRONG USAGE ------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m commit-1

# tigger-merge 
# tigger-merge b1
# tigger-merge b1 -m 
# tigger-merge b1 -ma m2 
# tigger-merge -m m3
# tigger-merge b1 -m m4 m5
# tigger-merge b1 b2 -m m4 m5

# close_tigger

# echo "-------------UNKOWN BRANCH------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m commit-1

# tigger-merge b1 -a m1

# close_tigger


# echo "-------------MERGE BRANCH WITH ITSELF------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m commit-1

# tigger-merge master -m m1

# tigger-branch b1
# tigger-checkout b1

# tigger-merge b1 -m m1
# tigger-merge master -m m1



# touch b
# tigger-add b
# tigger-commit -m commit-2
# print_all 0 1
# tigger-merge b1 -m m1
# tigger-merge master -m m1

# close_tigger



# echo "-------------INDEX_ONLY------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m commit-0

# tigger-branch b1
# tigger-checkout b1

# tigger-merge master -m m1


# # touch b
# # tigger-add b
# # tigger-commit -m commit-1

# # print_all 0 1

# close_tigger



# echo "-------------MERGE BRANCH NO COMMITS------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m commit-1

# tigger-merge master -m m1

# tigger-branch b1
# tigger-checkout b1

# tigger-merge b1 -m m1

# tigger-merge master -m m1

# close_tigger




# echo "-------------FAST FORWARD B1 TO MASTER------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m commit-0

# tigger-branch b2
# tigger-branch b1
# tigger-checkout b1


# touch b
# tigger-add b
# tigger-commit -m commit-1

# touch c
# rm a b
# tigger-add a b c
# tigger-commit -m commit-2


# touch d
# tigger-add d
# tigger-commit -m commit-3

# tigger-checkout b2




# touch e
# tigger-add e
# tigger-commit -m commit-4

# touch f
# tigger-add f
# tigger-commit -m commit-5


# print_all 0 1 2 3 4 5


# tigger-checkout b1
# tigger-merge master -m m2
# tigger-checkout master
# print_all 0 1 2 3 4 5

# # tigger-merge b1 -m m1

# close_tigger


# echo "-------------FAST FORWARD MASTER TO B1------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m commit-0

# tigger-branch b2
# tigger-branch b1
# tigger-checkout b1


# touch b
# tigger-add b
# tigger-commit -m commit-1

# touch c
# rm a b
# tigger-add a b c
# tigger-commit -m commit-2


# touch d
# tigger-add d
# tigger-commit -m commit-3

# tigger-checkout b2




# touch e
# tigger-add e
# tigger-commit -m commit-4

# touch f
# tigger-add f
# tigger-commit -m commit-5





# tigger-checkout master




# tigger-merge b1 -m m2
# print_all 0 1 2 3 4 5
# close_tigger


echo "-------------MERGE MASTER B1 TO B2 NO CONFLICT------------"
open_tigger
touch a 
tigger-add a 
tigger-commit -m commit-0

tigger-branch b2
tigger-branch b1
tigger-checkout b1


touch b
tigger-add b
tigger-commit -m commit-1

touch c
rm a b
tigger-add a b c
tigger-commit -m commit-2


touch d
tigger-add d
tigger-commit -m commit-3

tigger-checkout b2

touch e
tigger-add e
tigger-rm a
tigger-commit -m commit-4

touch f
tigger-add f
tigger-commit -m commit-5


#print_all 0 1 2 3 4 5


tigger-checkout b1
tigger-merge b2 -m m2

print_all 0 1 2 3 4 5 6
close_tigger



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











































