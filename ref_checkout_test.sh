#!/bin/dash
 
PATH=$PATH:/Users/brono/GitHub/tigger

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'


mkdir del
cd del

echo "-------------WRONG USAGE & NO REPO------------"
2041 tigger-checkout a b c ;echo "Exit status: $?"
2041 tigger-checkout     ;echo "Exit status: $?"
echo ''


echo "-------------WRONG USAGE NO COMMIT ------------"
ref_open_tigger
2041 tigger-checkout a b c ;echo "Exit status: $?"
2041 tigger-checkout       ;echo "Exit status: $?"
close_tigger

echo "-------------WRONG USAGE WITH COMMIT------------"
ref_open_tigger
touch a 
2041 tigger-add a
2041 tigger-commit -m 'a'

2041 tigger-checkout 
2041 tigger-checkout  1 2
close_tigger


echo "-------------CHECKOUT UNKNOWN BRANCH------------"
ref_open_tigger
touch a 
2041 tigger-add a
2041 tigger-commit -m 'a'



2041 tigger-checkout b1
close_tigger

echo "-------------CHECKOUT FLOATING COMMIT------------"
ref_open_tigger


echo x > b
echo 1 > a
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 

ref_print_all 0 1

2041 tigger-branch b1
2041 tigger-checkout b1

2041 tigger-branch b2
2041 tigger-checkout b2
echo y > b
2041 tigger-add b
2041 tigger-commit -m 'commit 1'
ref_print_all 0 1
2041 tigger-checkout b1
ref_print_all 0 1



close_tigger


echo "-------------PWD_ONLY------------"
ref_open_tigger


echo 1 > c 
2041 tigger-add c
2041 tigger-commit -m "commit 0" 
2041 tigger-rm --force c 
echo 1 > a
echo 2 > b

ref_print_all 0 

2041 tigger-branch b1
2041 tigger-checkout b1 
rm a
echo 2 > c 
2041 tigger-add c
2041 tigger-commit -m "commit 1" 
2041 tigger-rm --force c 
echo 2 > a
echo 2 > b
ref_print_all 0 1

2041 tigger-checkout master
close_tigger


echo "-------------INDEX_ONLY------------"
ref_open_tigger



echo 1 > c 
2041 tigger-add c
2041 tigger-commit -m "commit 0" 
2041 tigger-rm --force c 


echo 1 > a 
echo 1 > b
2041 tigger-add a b 
rm a b
ref_print_all 0 


2041 tigger-branch b1
2041 tigger-checkout b1 
echo 2 > c
2041 tigger-add c
2041 tigger-rm --force a b 
2041 tigger-commit -m "commit 1" 
2041 tigger-rm --force c

echo 2 > a 
echo 2 > b
2041 tigger-add a b 
rm a b
ref_print_all 0 1

2041 tigger-checkout master
close_tigger


echo "-------------IND_AND_PWD------------"
ref_open_tigger



echo 1 > c 
2041 tigger-add c
2041 tigger-commit -m "commit 0" 
2041 tigger-rm --force c 

echo 1 > a 
echo 1 > b
2041 tigger-add a b 
ref_print_all 0 

2041 tigger-branch b1
2041 tigger-checkout b1
2041 tigger-rm --force a b
echo 2 > c 
2041 tigger-add c
2041 tigger-commit -m "commit 1" 
2041 tigger-rm --force c
echo 2 > a 
echo 2 > b
2041 tigger-add a b 
ref_print_all 0  1

2041 tigger-checkout master
close_tigger

echo "-------------DELTA_IND_PWD------------"
ref_open_tigger


echo 1 > a 
echo 1 > b
echo 1 > c 
2041 tigger-add c
2041 tigger-commit -m "commit 0" 
2041 tigger-rm c
2041 tigger-add a b 
echo 2 > a 
echo 2 > b
ref_print_all 0 

2041 tigger-branch b1
2041 tigger-checkout b1


echo 2 > c 
2041 tigger-add c
2041 tigger-rm --force --cached a b 
2041 tigger-commit -m "commit 1"
2041 tigger-rm --force c 
echo 2 > a 
echo 2 > b
2041 tigger-add a b 
echo 3 > a 
echo 3 > b
ref_print_all 0 1


2041 tigger-checkout master
close_tigger


echo "-------------REP_ONLY------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 
2041 tigger-rm  a b 

ref_print_all 0 

2041 tigger-branch b1
2041 tigger-checkout b1
echo 2 > a 
echo 2 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 1"

2041 tigger-rm a b 
ref_print_all 0 1

2041 tigger-checkout master
close_tigger


echo "-------------REP_AND_PWD------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 
2041 tigger-rm --cached a b 

ref_print_all 0 

2041 tigger-branch b1
2041 tigger-checkout b1
echo 2 > a 
echo 2 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 1"

2041 tigger-rm --cached a b 
ref_print_all 0 1

2041 tigger-checkout master
close_tigger


echo "-------------DELTA_REP_PWD------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 
2041 tigger-rm --cached a b 

ref_print_all 0 

2041 tigger-branch b1
2041 tigger-checkout b1
echo 2 > a 
echo 2 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 1"
2041 tigger-rm --cached a b 
ref_print_all 0 1

2041 tigger-checkout master



close_tigger



echo "-------------REP_AND_IND------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 

rm a b
ref_print_all 0 


2041 tigger-branch b1
2041 tigger-checkout b1
echo 2 > a 
echo 2 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 1"
rm a b
ref_print_all 0 1

2041 tigger-checkout master
ref_print_all 0 1


close_tigger


echo "-------------DELTA_REP_IND------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 
echo 2 > a 
echo 2 > b
2041 tigger-add a b
rm a b
ref_print_all 0 


2041 tigger-branch b1
2041 tigger-checkout b1
2041 tigger-commit -m "commit 1"
echo 3 > a 
echo 3 > b
2041 tigger-add a b
rm a b
ref_print_all 0 1


2041 tigger-checkout master

close_tigger






echo "-------------ALL_SAME------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 

ref_print_all 0 



2041 tigger-branch b1
2041 tigger-checkout b1

echo 2 > a 
echo 2 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 1" 
ref_print_all 0 1
2041 tigger-checkout master
ref_print_all 0 1
close_tigger


#IND = REP
echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
ref_open_tigger



echo 1 > a 
echo 1 > 'b_file'
2041 tigger-add a 'b_file'
2041 tigger-commit -m "commit 0" 
ref_print_all 0 



2041 tigger-branch b1
2041 tigger-checkout b1
echo 2 > a
echo 2 > 'b_file'

ref_print_all 0 

2041 tigger-add a 'b_file'
2041 tigger-checkout master

2041 tigger-commit -m "commit 1" 

echo 3 > a
echo 3 > 'b_file'

2041 tigger-checkout b1

ref_print_all 0 1
close_tigger



#IND = PWD
echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 

echo 2 > a 
echo 2 > b
2041 tigger-add a b
ref_print_all 0 



2041 tigger-branch b1
2041 tigger-checkout b1
2041 tigger-commit -m "commit 1" 
echo 3 > a 
echo 3 > b
2041 tigger-add a b
ref_print_all 0 1

2041 tigger-checkout master
close_tigger






#REP = PWD
echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 

echo 2 > a 
echo 2 > b
2041 tigger-add a b

echo 1 > a 
echo 1 > b

ref_print_all 0 

2041 tigger-branch b1
2041 tigger-checkout b1
2041 tigger-commit -m "commit 1" 


echo 3 > a 
echo 3 > b
2041 tigger-add a b
echo 2 > a 
echo 2 > b


ref_print_all 0 1
2041 tigger-checkout master
close_tigger


echo "-------------ALL_DIFFERENT------------"
ref_open_tigger



echo 1 > a 
echo 1 > b
2041 tigger-add a b
2041 tigger-commit -m "commit 0" 

echo 2 > a 
echo 2 > b
2041 tigger-add a b


echo 3 > a 
echo 3 > b

ref_print_all 0 

2041 tigger-branch b1
2041 tigger-checkout b1



2041 tigger-commit -m "commit 1" 
2041 tigger-add a b
echo 4 > a 
echo 4 > b

ref_print_all 0 1

2041 tigger-checkout master

close_tigger






cd ..
rm -fr del







































