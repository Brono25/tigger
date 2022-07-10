#!/bin/dash


. ./test_functions.sh


trap 'rm -fr a b c d .tigger' EXIT INT

[ -d  '.tigger' ] && rm -rf '.tigger'


mkdir del
cd del


2041 tigger-init











echo "-------------ALL_DIFFERENT------------"

echo f > a
2041 tigger-add a 
2041 tigger-commit -m 'a' 1>/dev/null
echo ff > a
2041 tigger-add a 
echo fff > a


2041 tigger-rm a ;echo "$?" 1>&2




echo f > a
2041 tigger-add a 
2041 tigger-commit -m 'a' 1>/dev/null
echo ff > a
2041 tigger-add a 
echo fff > a


2041 tigger-rm --force a ;echo "$?" 1>&2




echo f > a
2041 tigger-add a 
2041 tigger-commit -m 'a' 1>/dev/null
echo ff > a
2041 tigger-add a 
echo fff > a


2041 tigger-rm --cached a ;echo "$?" 1>&2




echo f > a
2041 tigger-add a 
2041 tigger-commit -m 'a' 1>/dev/null
echo ff > a
2041 tigger-add a 
echo fff > a


2041 tigger-rm --force --cached a ;echo "$?" 1>&2





cd ..
rm -rf 'del'