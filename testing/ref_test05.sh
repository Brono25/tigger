#!/bin/dash





trap 'rm -fr a b c d .2041 tigger' EXIT INT

[ -d  '.2041 tigger' ] && rm -rf '.2041 tigger'



echo "-------------NO REPO------------"
2041 tigger-show NULL:a
echo "$?"
echo "\n"


echo "-------------WRONG USAGE NO REPO------------"
2041 tigger-show 
echo "\n"


echo "-------------WRONG USAGE WITH REPO------------"
2041 tigger-init 
2041 tigger-show 'a' ':'
2041 tigger-show x::a ; echo "$?"
2041 tigger-show 0a ; echo "$?"
2041 tigger-show 0:a ; echo "$?"
2041 tigger-show :a ; echo "$?"
2041 tigger-show : ; echo "$?"

2041 tigger-show s:0:b:v ; echo "$?"
echo "\n"

echo "-------------WITH ONE COMMMIT------------"
echo 'line 1' > a
2041 tigger-add a
2041 tigger-commit -m 'commit a'
2041 tigger-show 0:a ; echo "$?"
2041 tigger-show 0:-file ; echo "$?"
2041 tigger-show 0:.file ; echo "$?"
2041 tigger-show 0:_file ; echo "$?"
2041 tigger-show 0:file- ; echo "$?"
2041 tigger-show 0:file_c ; echo "$?"
2041 tigger-show 0:file.c ; echo "$?"
echo "\n"


echo "-------------WITH TWO COMMMIT------------"
echo 'line 2' >> a
2041 tigger-add a ; echo "$?"
2041 tigger-commit -m 'commit a again' ; echo "$?"
2041 tigger-show 0:a ; echo "$?"
2041 tigger-show 1:a ; echo "$?"
2041 tigger-show :a ; echo "$?"
2041 tigger-show : ; echo "$?"
2041 tigger-show :: ; echo "$?"

echo "\n"



echo "-------------UNKNOWN COMMMIT------------"

2041 tigger-show z:a 
echo "$?"
echo "\n"


echo "-------------FILE NOT FOUND------------"

2041 tigger-show 0:b
2041 tigger-show :b
echo "$?"
echo "\n"



echo "------------SHOW EMPTY FILE------------"
touch c
2041 tigger-add c
2041 tigger-commit -m 'commit c'
2041 tigger-show 2:c
echo "$?"

echo "\n"


echo "------------NOT IN INDEX------------"
echo 'text in d' > d
2041 tigger-add d
2041 tigger-commit -m 'commit d'
2041 tigger-rm --force --cached d
2041 tigger-show 3:d
echo "$?"
echo "\n"

