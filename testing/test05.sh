#!/bin/dash





trap 'rm -fr a b c d .tigger' EXIT INT

[ -d  '.tigger' ] && rm -rf '.tigger'



echo "-------------NO REPO------------"
tigger-show NULL:a
echo "$?"
echo "\n"


echo "-------------WRONG USAGE NO REPO------------"
tigger-show 
echo "\n"


echo "-------------WRONG USAGE WITH REPO------------"
tigger-init 
tigger-show 'a' ':'
tigger-show x::a ; echo "$?"
tigger-show 0a ; echo "$?"
tigger-show 0:a ; echo "$?"
tigger-show :a ; echo "$?"
tigger-show : ; echo "$?"

tigger-show s:0:b:v ; echo "$?"
echo "\n"

echo "-------------WITH ONE COMMMIT------------"
echo 'line 1' > a
tigger-add a
tigger-commit -m 'commit a'
tigger-show 0:a ; echo "$?"
tigger-show 0:-file ; echo "$?"
tigger-show 0:.file ; echo "$?"
tigger-show 0:_file ; echo "$?"
tigger-show 0:file- ; echo "$?"
tigger-show 0:file_c ; echo "$?"
tigger-show 0:file.c ; echo "$?"
echo "\n"


echo "-------------WITH TWO COMMMIT------------"
echo 'line 2' >> a
tigger-add a ; echo "$?"
tigger-commit -m 'commit a again' ; echo "$?"
tigger-show 0:a ; echo "$?"
tigger-show 1:a ; echo "$?"
tigger-show :a ; echo "$?"
tigger-show : ; echo "$?"
tigger-show :: ; echo "$?"

echo "\n"



echo "-------------UNKNOWN COMMMIT------------"

tigger-show z:a 
echo "$?"
echo "\n"


echo "-------------FILE NOT FOUND------------"

tigger-show 0:b
tigger-show :b
echo "$?"
echo "\n"



echo "------------SHOW EMPTY FILE------------"
touch c
tigger-add c
tigger-commit -m 'commit c'
tigger-show 2:c
echo "$?"

echo "\n"


echo "------------NOT IN INDEX------------"
echo 'text in d' > d
tigger-add d
tigger-commit -m 'commit d'
tigger-rm --force --cached d
tigger-show 3:d
echo "$?"
echo "\n"




