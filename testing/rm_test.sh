#!/bin/dash


. ./test_functions.sh


trap 'rm -fr a b c d .tigger' EXIT INT

[ -d  '.tigger' ] && rm -rf '.tigger'


mkdir del
cd del

# echo "-------------NO REPO------------"
# tigger-rm 
# echo "\n"

# echo "-------------WRONG USAGE NO REPO------------"
# tigger-rm -x
# echo "\n"

# echo "-------------WRONG USAGE WITH REPO------------"
# open_tigger
# tigger-rm -x word
# close_tigger

# echo "-------------NO FILE GIVEN------------"
# open_tigger
# tigger-rm --force           ;echo "Exit status: $?"
# tigger-rm --cached          ;echo "Exit status: $?"
# tigger-rm --force  --cached ;echo "Exit status: $?"
# close_tigger


# echo "-------------NONE_FOUND------------"
# open_tigger
# tigger-rm a b                  ;echo "Exit status: $?"
# tigger-rm --force a b          ;echo "Exit status: $?"
# tigger-rm --cached b a         ;echo "Exit status: $?"
# tigger-rm --force --cached a b ;echo "Exit status: $?"
# close_tigger



# echo "-------------PWD_ONLY------------"
# open_tigger
# echo f > a
# print_pwd;  
# tigger-rm a                    ;echo "Exit status: $?"
# tigger-rm --force a            ;echo "Exit status: $?"
# tigger-rm --cached a           ;echo "Exit status: $?"
# tigger-rm --force  --cached a  ;echo "Exit status: $?"
# print_pwd;  
# close_tigger



# echo "-------------INDEX_ONLY------------"
# open_tigger
# echo f > a
# tigger-add a 
# rm -f a
# echo "[no options]"
# echo "initial"
# print_pwd;  
# tigger-rm a 				
# echo "after tigger-rm"
# print_pwd;  

# echo f > a
# tigger-add a 
# rm -f a
# echo "[--cached]"
# echo "initial"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# echo "after tigger-rm"
# print_pwd;  

# echo f > a
# tigger-add a 
# rm -f a
# echo "[--force]"
# echo "initial"
# print_pwd;  
# tigger-rm --force a;echo "Exit status: $?"
# echo "after tigger-rm"
# print_pwd;  

# echo f > a
# tigger-add a 
# rm -f a
# echo "[--force --cached]"
# echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# echo "after tigger-rm"
# print_pwd;  
# close_tigger



# echo "-------------IND_AND_PWD------------"
# open_tigger
# echo f > a
# tigger-add a 
# echo "[no options]"
# echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# echo "after tigger-rm"
# print_pwd;  

# echo f > a
# tigger-add a 
# echo "[--cached]"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# echo "after tigger-rm"
# print_pwd;  

# echo f > a
# tigger-add a 
# echo "[--force]"
# echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# echo "after tigger-rm"
# print_pwd;  

# echo f > a
# tigger-add a 
# echo "[--force --cached]"
# echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# echo "after tigger-rm"
# print_pwd;  
# close_tigger




# echo "-------------DELTA_IND_PWD------------"
# open_tigger
# echo f > a
# tigger-add a 
# echo ff > a
# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# print_pwd;  

# echo f > a
# tigger-add a 
# echo ff > a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# tigger-rm --cached a ; echo "Exit status: $?"
# print_pwd;  

# echo f > a
# tigger-add a 
# echo ff > a
# echo "[--force]"; echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  

# echo f > a
# tigger-add a 
# echo ff > a
# echo "[--force --cached]";echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------REP_ONLY------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# tigger-rm --cached a 1>/dev/null
# rm -f a
# print_pwd;  
# tigger-rm a 
# tigger-rm --force a 
# tigger-rm --cached a 
# tigger-rm --force  --cached a
# print_pwd;  
# close_tigger


# echo "-------------REP_AND_PWD------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# tigger-rm --cached a 1>/dev/null
# print_pwd;  
# tigger-rm a 
# tigger-rm --force a 
# tigger-rm --cached a 
# tigger-rm --force  --cached a
# print_pwd;  
# close_tigger


# echo "-------------DELTA_REP_PWD------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# tigger-rm --cached a 1>/dev/null
# echo ff > a
# print_pwd;  
# tigger-rm a 
# tigger-rm --force a 
# tigger-rm --cached a 
# tigger-rm --force  --cached a
# print_pwd;  
# close_tigger




# echo "-------------REP_AND_IND------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# rm -f a
# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# rm -f a
# echo "[--force]"; echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# rm -f a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# rm -f a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------DELTA_REP_IND------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# rm -f a
# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# rm -f a
# echo "[--force]"; echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# rm -f a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# rm -f a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------ALL_FOUND------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo "[--force]"; echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo "[--cached]"; echo "initial"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# #IND = REP
# echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# echo "[--force]"; echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# #IND = PWD
# echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo "[--force]"; echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo "[--cached]"; echo "initial"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# #REP=PWD
# echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo f > a
# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo f > a
# echo "[--force]"; echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo f > a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo f > a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger



# echo "-------------ALL_DIFFERENT------------"
# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo fff > a
# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo fff > a
# echo "[--force]"; echo "initial"
# print_pwd;  
# tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo fff > a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# open_tigger
# echo f > a
# tigger-add a 
# tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# tigger-add a 
# echo fff > a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger



echo "-------------MULTIPLE_FILES FATAL INDEX------------"
open_tigger
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo fff > a
print_pwd;  
tigger-rm a b ;echo "Exit status: $?"
print_pwd;  
close_tigger


# echo "-------------MULTIPLE FILES ERROR ORDER-[no options]------------"
# open_tigger
# touch b c d f g h i
# tigger-add b c d f g h i
# tigger-commit -m 'first commit' 

# touch a e j
# echo x > c; echo x > f; echo x > h; echo x > i
# tigger-add a e j c f h i

# rm -f a b c h
# echo x > g
# echo x > j
# echo xx > i
# touch h

# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm a b c d e f g h i j ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# echo "-------------MULTIPLE FILES ERROR ORDER-[--force]------------"
# open_tigger
# touch b c d f g h i
# tigger-add b c d f g h i
# tigger-commit -m 'first commit' 

# touch a e j
# echo x > c; echo x > f; echo x > h; echo x > i
# tigger-add a e j c f h i

# rm -f a b c h
# echo x > g
# echo x > j
# echo xx > i
# touch h

# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm --force g h i c f j d e a b   ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------MULTIPLE FILES ERROR ORDER-[--cached]------------"
# open_tigger
# touch b c d f g h i
# tigger-add b c d f g h i
# tigger-commit -m 'first commit' 

# touch a e j
# echo x > c; echo x > f; echo x > h; echo x > i
# tigger-add a e j c f h i

# rm -f a b c h
# echo x > g
# echo x > j
# echo xx > i
# touch h

# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm --cached g h i c f j d e a b   ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------MULTIPLE FILES SAME ERROR------------"
# open_tigger
# touch  f x g y h z i s
# tigger-add  f x g y h z i s
# tigger-commit -m 'first commit' 

# touch  e j k
# echo x > f; echo x > x; echo x > h; echo x > z; echo x > i;  echo x > s
# tigger-add  e j k f x h z i s

# rm -f h z
# echo x > g
# echo x > y
# echo x > j
# echo x > k
# echo xx > i
# echo xx > s
# touch h z
# tigger-commit -m 'second commit' 

# echo "[no options]"; echo "initial"
# print_pwd;  
# tigger-rm  e f x g y h z i s j k;echo "Exit status: $?"
# print_pwd;  
# close_tigger


cd ..
rm -rf 'del'