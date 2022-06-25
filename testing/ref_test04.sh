

trap 'rm -rf a b c .tigger' EXIT INT

[ -d  '.tigger' ] && rm -rf '.tigger'

echo "-------------NO REPO------------"
2041 tigger-log
echo ""


echo "-------------WITH REPO NO COMMITS------------"
2041 tigger-init
2041 tigger-log
echo ""

echo "-------------WRONG USAGE------------"
2041 tigger-log a b c
echo ""

echo "-------------WITH 1 & 2 COMMITS------------"
rm -f a b c
touch a b c
2041 tigger-add a 
2041 tigger-commit -m 'commit a'
2041 tigger-log
2041 tigger-add b 
2041 tigger-commit -m 'commit b'
2041 tigger-log
2041 tigger-add c 
2041 tigger-commit -m 'commit c'
2041 tigger-log
echo ""


#different names same content
echo "-------------RECOMMITTED EDITED FILE------------"
echo "a" > a
2041 tigger-add a 
2041 tigger-commit -m 'commit a edited'
2041 tigger-log
echo ""




