#!/bin/dash
 

. ./test_functions.sh


[ -d  tmp ] && rm -r tmp

mkdir tmp
cd tmp


(


echo "-------------FAST FORWARD B1 TO MASTER------------"
ref_open_tigger
touch a 
2041 tigger-add a
2041 tigger-commit -m commit-0

2041 tigger-branch b2
2041 tigger-branch b1
2041 tigger-checkout b1


2041 tigger-merge b1 -m m1

close_tigger




) 2> f 1> g 

cat f g 













# echo "-------------FAST FORWARD MASTER TO B1------------"
# ref_open_tigger
# touch a 
# 2041 tigger-add a
# 2041 tigger-commit -m commit-0

# 2041 tigger-branch b2
# 2041 tigger-branch b1
# 2041 tigger-checkout b1


# touch b
# 2041 tigger-add b
# 2041 tigger-commit -m commit-1cd ..

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


# #ref_print_all 0 1 2 3 4 5


# 2041 tigger-checkout master
# 2041 tigger-merge b1 -m m2

# ref_print_all 0 1 2 3 4 5
# close_tigger


# echo "-------------MERGE MASTER B1 TO B2 NO CONFLICT------------"
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
# 2041 tigger-rm a
# 2041 tigger-commit -m commit-4

# touch f
# 2041 tigger-add f
# 2041 tigger-commit -m commit-5


# #ref_print_all 0 1 2 3 4 5


# 2041 tigger-checkout b1
# 2041 tigger-merge b2 -m m2

# ref_print_all 0 1 2 3 4 5 6
# close_tigger


# echo "-------------DELTA_D1_D3------------"
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
# echo x > a
# rm  b
# 2041 tigger-add a b c
# 2041 tigger-commit -m commit-2


# touch d
# 2041 tigger-add d
# 2041 tigger-commit -m commit-3

# 2041 tigger-checkout b2




# touch e
# 2041 tigger-add e
# 2041 tigger-rm a
# 2041 tigger-commit -m commit-4

# touch f
# 2041 tigger-add f
# 2041 tigger-commit -m commit-5


# #ref_print_all 0 1 2 3 4 5


# 2041 tigger-checkout b1
# 2041 tigger-merge b2 -m m2

# ref_print_all 0 1 2 3 4 5 6
# close_tigger



# echo "-------------DELTA_D1_D3------------"
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
# echo x > a
# rm  b
# 2041 tigger-add a b c
# 2041 tigger-commit -m commit-2


# touch d
# 2041 tigger-add d
# 2041 tigger-commit -m commit-3

# 2041 tigger-checkout b2




# touch e
# 2041 tigger-add e
# 2041 tigger-rm a
# 2041 tigger-commit -m commit-4

# touch f
# 2041 tigger-add f
# 2041 tigger-commit -m commit-5


# #ref_print_all 0 1 2 3 4 5


# 2041 tigger-checkout b2
# 2041 tigger-merge b1 -m m2

# ref_print_all 0 1 2 3 4 5 6
# close_tigger


# echo "-------------DELTA_D1_D3------------"
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
# echo x > a
# rm  b
# 2041 tigger-add a b c
# 2041 tigger-commit -m commit-2


# touch d
# 2041 tigger-add d
# 2041 tigger-commit -m commit-3

# 2041 tigger-checkout b2




# touch e
# 2041 tigger-add e
# 2041 tigger-rm a
# 2041 tigger-commit -m commit-4

# touch f
# 2041 tigger-add f
# 2041 tigger-commit -m commit-5


# #ref_print_all 0 1 2 3 4 5


# 2041 tigger-checkout b2
# 2041 tigger-merge b1 -m m2

# ref_print_all 0 1 2 3 4 5 6
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










cd ..
rm -fr tmp
































