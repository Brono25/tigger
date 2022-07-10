#!/bin/dash
 
PATH=$PATH:/Users/brono/GitHub/tigger

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'


mkdir del
cd del

# echo "-------------WRONG USAGE & NO REPO------------"
# tigger-checkout a b c ;echo "Exit status: $?"
# tigger-checkout     ;echo "Exit status: $?"
# echo ''


# echo "-------------WRONG USAGE NO COMMIT ------------"
# open_tigger
# tigger-checkout a b c ;echo "Exit status: $?"
# tigger-checkout       ;echo "Exit status: $?"
# close_tigger

# echo "-------------WRONG USAGE WITH COMMIT------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m 'a'

# tigger-checkout 
# tigger-checkout  1 2
# close_tigger


# echo "-------------CHECKOUT UNKNOWN BRANCH------------"
# open_tigger
# touch a 
# tigger-add a
# tigger-commit -m 'a'



# tigger-checkout b1
# close_tigger

# echo "-------------CHECKOUT FLOATING COMMIT------------"
# open_tigger


# echo x > b
# echo 1 > a
# tigger-add a b
# tigger-commit -m "commit 0" 

# print_all 0 1

# tigger-branch b1
# tigger-checkout b1

# tigger-branch b2
# tigger-checkout b2
# echo y > b
# tigger-add b
# tigger-commit -m 'commit 1'
# print_all 0 1
# tigger-checkout b1
# print_all 0 1



# close_tigger


# echo "-------------PWD_ONLY------------"
# open_tigger


# echo 1 > c 
# tigger-add c
# tigger-commit -m "commit 0" 
# tigger-rm --force c 
# echo 1 > a
# echo 2 > b

# print_all 0 

# tigger-branch b1
# tigger-checkout b1 
# rm a
# echo 2 > c 
# tigger-add c
# tigger-commit -m "commit 1" 
# tigger-rm --force c 
# echo 2 > a
# echo 2 > b
# print_all 0 1

# tigger-checkout master
# close_tigger


# echo "-------------INDEX_ONLY------------"
# open_tigger



# echo 1 > c 
# tigger-add c
# tigger-commit -m "commit 0" 
# tigger-rm --force c 


# echo 1 > a 
# echo 1 > b
# tigger-add a b 
# rm a b
# print_all 0 


# tigger-branch b1
# tigger-checkout b1 
# echo 2 > c
# tigger-add c
# tigger-rm --force a b 
# tigger-commit -m "commit 1" 
# tigger-rm --force c

# echo 2 > a 
# echo 2 > b
# tigger-add a b 
# rm a b
# print_all 0 1

# tigger-checkout master
# close_tigger


# echo "-------------IND_AND_PWD------------"
# open_tigger



# echo 1 > c 
# tigger-add c
# tigger-commit -m "commit 0" 
# tigger-rm --force c 

# echo 1 > a 
# echo 1 > b
# tigger-add a b 
# print_all 0 

# tigger-branch b1
# tigger-checkout b1
# tigger-rm --force a b
# echo 2 > c 
# tigger-add c
# tigger-commit -m "commit 1" 
# tigger-rm --force c
# echo 2 > a 
# echo 2 > b
# tigger-add a b 
# print_all 0  1

# tigger-checkout master
# close_tigger

# echo "-------------DELTA_IND_PWD------------"
# open_tigger


# echo 1 > a 
# echo 1 > b
# echo 1 > c 
# tigger-add c
# tigger-commit -m "commit 0" 
# tigger-rm c
# tigger-add a b 
# echo 2 > a 
# echo 2 > b
# print_all 0 

# tigger-branch b1
# tigger-checkout b1


# echo 2 > c 
# tigger-add c
# tigger-rm --force --cached a b 
# tigger-commit -m "commit 1"
# tigger-rm --force c 
# echo 2 > a 
# echo 2 > b
# tigger-add a b 
# echo 3 > a 
# echo 3 > b
# print_all 0 1


# tigger-checkout master
# close_tigger


# echo "-------------REP_ONLY------------"
# open_tigger



# echo 1 > a 
# echo 1 > b
# tigger-add a b
# tigger-commit -m "commit 0" 
# tigger-rm  a b 

# print_all 0 

# tigger-branch b1
# tigger-checkout b1
# echo 2 > a 
# echo 2 > b
# tigger-add a b
# tigger-commit -m "commit 1"

# tigger-rm a b 
# print_all 0 1

# tigger-checkout master
# close_tigger


# echo "-------------REP_AND_PWD------------"
# open_tigger



# echo 1 > a 
# echo 1 > b
# tigger-add a b
# tigger-commit -m "commit 0" 
# tigger-rm --cached a b 

# print_all 0 

# tigger-branch b1
# tigger-checkout b1
# echo 2 > a 
# echo 2 > b
# tigger-add a b
# tigger-commit -m "commit 1"

# tigger-rm --cached a b 
# print_all 0 1

# tigger-checkout master
# close_tigger


# echo "-------------DELTA_REP_PWD------------"
# open_tigger



# echo 1 > a 
# echo 1 > b
# tigger-add a b
# tigger-commit -m "commit 0" 
# tigger-rm --cached a b 

# print_all 0 

# tigger-branch b1
# tigger-checkout b1
# echo 2 > a 
# echo 2 > b
# tigger-add a b
# tigger-commit -m "commit 1"
# tigger-rm --cached a b 
# print_all 0 1

# tigger-checkout master



# close_tigger



echo "-------------REP_AND_IND------------"
open_tigger



echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0" 

rm a b
print_all 0 


tigger-branch b1
tigger-checkout b1
echo 2 > a 
echo 2 > b
tigger-add a b
tigger-commit -m "commit 1"
rm a b
print_all 0 1

tigger-checkout master
print_all 0 1


close_tigger


# echo "-------------DELTA_REP_IND------------"
# open_tigger



# echo 1 > a 
# echo 1 > b
# tigger-add a b
# tigger-commit -m "commit 0" 
# echo 2 > a 
# echo 2 > b
# tigger-add a b
# rm a b
# print_all 0 


# tigger-branch b1
# tigger-checkout b1
# tigger-commit -m "commit 1"
# echo 3 > a 
# echo 3 > b
# tigger-add a b
# rm a b
# print_all 0 1


# tigger-checkout master

# close_tigger






# echo "-------------ALL_SAME------------"
# open_tigger



# echo 1 > a 
# echo 1 > b
# tigger-add a b
# tigger-commit -m "commit 0" 

# print_all 0 



# tigger-branch b1
# tigger-checkout b1

# echo 2 > a 
# echo 2 > b
# tigger-add a b
# tigger-commit -m "commit 1" 
# print_all 0 1
# tigger-checkout master
# print_all 0 1
# close_tigger


# #IND = REP
# echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
# open_tigger



# echo 1 > a 
# echo 1 > 'b_file'
# tigger-add a 'b_file'
# tigger-commit -m "commit 0" 
# print_all 0 



# tigger-branch b1
# tigger-checkout b1
# echo 2 > a
# echo 2 > 'b_file'

# print_all 0 

# tigger-add a 'b_file'
# tigger-checkout master

# tigger-commit -m "commit 1" 

# echo 3 > a
# echo 3 > 'b_file'

# tigger-checkout b1

# print_all 0 1
# close_tigger



# #IND = PWD
# echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
# open_tigger



# echo 1 > a 
# echo 1 > b
# tigger-add a b
# tigger-commit -m "commit 0" 

# echo 2 > a 
# echo 2 > b
# tigger-add a b
# print_all 0 



# tigger-branch b1
# tigger-checkout b1
# tigger-commit -m "commit 1" 
# echo 3 > a 
# echo 3 > b
# tigger-add a b
# print_all 0 1

# tigger-checkout master
# close_tigger






# # #REP = PWD
# echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
# open_tigger



# echo 1 > a 
# echo 1 > b
# tigger-add a b
# tigger-commit -m "commit 0" 

# echo 2 > a 
# echo 2 > b
# tigger-add a b

# echo 1 > a 
# echo 1 > b

# print_all 0 

# tigger-branch b1
# tigger-checkout b1
# tigger-commit -m "commit 1" 


# echo 3 > a 
# echo 3 > b
# tigger-add a b
# echo 2 > a 
# echo 2 > b


# print_all 0 1
# tigger-checkout master
# close_tigger


# echo "-------------ALL_DIFFERENT------------"
# open_tigger



# echo 1 > a 
# echo 1 > b
# tigger-add a b
# tigger-commit -m "commit 0" 

# echo 2 > a 
# echo 2 > b
# tigger-add a b


# echo 3 > a 
# echo 3 > b

# print_all 0 

# tigger-branch b1
# tigger-checkout b1



# tigger-commit -m "commit 1" 
# tigger-add a b
# echo 4 > a 
# echo 4 > b

# print_all 0 1

# tigger-checkout master

# close_tigger






cd ..
rm -fr del







































