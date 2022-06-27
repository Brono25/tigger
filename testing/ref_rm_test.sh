#!/bin/dash


. ./test_functions.sh


trap 'rm -fr a b c d .tigger' EXIT INT

[ -d  '.tigger' ] && rm -rf '.tigger'


mkdir del
cd del

# echo "-------------NO REPO------------"
# 2041 tigger-rm 
# echo "\n"

# echo "-------------WRONG USAGE NO REPO------------"
# 2041 tigger-rm -x
# echo "\n"

# echo "-------------WRONG USAGE WITH REPO------------"
# ref_open_tigger
# 2041 tigger-rm -x word
# close_tigger

# echo "-------------NO FILE GIVEN------------"
# ref_open_tigger
# 2041 tigger-rm --force           ;echo "Exit status: $?"
# 2041 tigger-rm --cached          ;echo "Exit status: $?"
# 2041 tigger-rm --force  --cached ;echo "Exit status: $?"
# close_tigger


# echo "-------------NONE_FOUND------------"
# ref_open_tigger
# 2041 tigger-rm a b                  ;echo "Exit status: $?"
# 2041 tigger-rm --force a b          ;echo "Exit status: $?"
# 2041 tigger-rm --cached b a         ;echo "Exit status: $?"
# 2041 tigger-rm --force --cached a b ;echo "Exit status: $?"
# close_tigger



# echo "-------------PWD_ONLY------------"
# ref_open_tigger
# echo f > a
# print_pwd;  
# 2041 tigger-rm a                    ;echo "Exit status: $?"
# 2041 tigger-rm --force a            ;echo "Exit status: $?"
# 2041 tigger-rm --cached a           ;echo "Exit status: $?"
# 2041 tigger-rm --force  --cached a  ;echo "Exit status: $?"
# print_pwd;  
# close_tigger



# echo "-------------INDEX_ONLY------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# rm -f a
# echo "[no options]"
# echo "initial"
# print_pwd;  
# 2041 tigger-rm a 				
# echo "after 2041 tigger-rm"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# rm -f a
# echo "[--cached]"
# echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# echo "after 2041 tigger-rm"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# rm -f a
# echo "[--force]"
# echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a;echo "Exit status: $?"
# echo "after 2041 tigger-rm"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# rm -f a
# echo "[--force --cached]"
# echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# echo "after 2041 tigger-rm"
# print_pwd;  
# close_tigger



# echo "-------------IND_AND_PWD------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# echo "[no options]"
# echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# echo "after 2041 tigger-rm"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# echo "[--cached]"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# echo "after 2041 tigger-rm"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# echo "[--force]"
# echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# echo "after 2041 tigger-rm"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# echo "[--force --cached]"
# echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# echo "after 2041 tigger-rm"
# print_pwd;  
# close_tigger




# echo "-------------DELTA_IND_PWD------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# echo ff > a
# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# echo ff > a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ; echo "Exit status: $?"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# echo ff > a
# echo "[--force]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  

# echo f > a
# 2041 tigger-add a 
# echo ff > a
# echo "[--force --cached]";echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------REP_ONLY------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# 2041 tigger-rm --cached a 1>/dev/null
# rm -f a
# print_pwd;  
# 2041 tigger-rm a 
# 2041 tigger-rm --force a 
# 2041 tigger-rm --cached a 
# 2041 tigger-rm --force  --cached a
# print_pwd;  
# close_tigger


# echo "-------------REP_AND_PWD------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# 2041 tigger-rm --cached a 1>/dev/null
# print_pwd;  
# 2041 tigger-rm a 
# 2041 tigger-rm --force a 
# 2041 tigger-rm --cached a 
# 2041 tigger-rm --force  --cached a
# print_pwd;  
# close_tigger


# echo "-------------DELTA_REP_PWD------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# 2041 tigger-rm --cached a 1>/dev/null
# echo ff > a
# print_pwd;  
# 2041 tigger-rm a 
# 2041 tigger-rm --force a 
# 2041 tigger-rm --cached a 
# 2041 tigger-rm --force  --cached a
# print_pwd;  
# close_tigger




# echo "-------------REP_AND_IND------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# rm -f a
# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# rm -f a
# echo "[--force]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# rm -f a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# rm -f a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------DELTA_REP_IND------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# rm -f a
# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# rm -f a
# echo "[--force]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# rm -f a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# rm -f a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------ALL_FOUND------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo "[--force]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo "[--cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# #IND = REP
# echo "-------------DELTA_IND_PWD_DELTA_REP_PWD------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# echo "[--force]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# #IND = PWD
# echo "-------------DELTA_REP_IND_DELTA_REP_PWD------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo "[--force]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo "[--cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# #REP=PWD
# echo "-------------DELTA_REP_IND_DELTA_IND_PWD------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo f > a
# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo f > a
# echo "[--force]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo f > a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo f > a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger



# echo "-------------ALL_DIFFERENT------------"
# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo fff > a
# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo fff > a
# echo "[--force]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo fff > a
# echo "[--cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# ref_open_tigger
# echo f > a
# 2041 tigger-add a 
# 2041 tigger-commit -m 'a' 1>/dev/null
# echo ff > a
# 2041 tigger-add a 
# echo fff > a
# echo "[--force --cached]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force --cached a ;echo "Exit status: $?"
# print_pwd;  
# close_tigger



echo "-------------MULTIPLE_FILES FATAL INDEX------------"
ref_open_tigger
echo f > a
2041 tigger-add a 
2041 tigger-commit -m 'a' 1>/dev/null
echo ff > a
2041 tigger-add a 
echo fff > a
print_pwd;  
2041 tigger-rm a b ;echo "Exit status: $?"
print_pwd;  
close_tigger


# echo "-------------MULTIPLE FILES ERROR ORDER-[no options]------------"
# ref_open_tigger
# touch b c d f g h i
# 2041 tigger-add b c d f g h i
# 2041 tigger-commit -m 'first commit' 

# touch a e j
# echo x > c; echo x > f; echo x > h; echo x > i
# 2041 tigger-add a e j c f h i

# rm -f a b c h
# echo x > g
# echo x > j
# echo xx > i
# touch h

# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm a b c d e f g h i j ;echo "Exit status: $?"
# print_pwd;  
# close_tigger

# echo "-------------MULTIPLE FILES ERROR ORDER-[--force]------------"
# ref_open_tigger
# touch b c d f g h i
# 2041 tigger-add b c d f g h i
# 2041 tigger-commit -m 'first commit' 

# touch a e j
# echo x > c; echo x > f; echo x > h; echo x > i
# 2041 tigger-add a e j c f h i

# rm -f a b c h
# echo x > g
# echo x > j
# echo xx > i
# touch h

# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --force g h i c f j d e a b   ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------MULTIPLE FILES ERROR ORDER-[--cached]------------"
# ref_open_tigger
# touch b c d f g h i
# 2041 tigger-add b c d f g h i
# 2041 tigger-commit -m 'first commit' 

# touch a e j
# echo x > c; echo x > f; echo x > h; echo x > i
# 2041 tigger-add a e j c f h i

# rm -f a b c h
# echo x > g
# echo x > j
# echo xx > i
# touch h

# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm --cached g h i c f j d e a b   ;echo "Exit status: $?"
# print_pwd;  
# close_tigger


# echo "-------------MULTIPLE FILES SAME ERROR------------"
# ref_open_tigger
# touch  f x g y h z i s
# 2041 tigger-add  f x g y h z i s
# 2041 tigger-commit -m 'first commit' 

# touch  e j k
# echo x > f; echo x > x; echo x > h; echo x > z; echo x > i;  echo x > s
# 2041 tigger-add  e j k f x h z i s

# rm -f h z
# echo x > g
# echo x > y
# echo x > j
# echo x > k
# echo xx > i
# echo xx > s
# touch h z
# 2041 tigger-commit -m 'second commit' 

# echo "[no options]"; echo "initial"
# print_pwd;  
# 2041 tigger-rm  e f x g y h z i s j k;echo "Exit status: $?"
# print_pwd;  
# close_tigger


cd ..
rm -rf 'del'