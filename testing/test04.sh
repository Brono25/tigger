

trap 'rm -rf a b c .tigger' EXIT INT

[ -d  '.tigger' ] && rm -rf '.tigger'

echo "-------------NO REPO------------"
tigger-log
echo ""


echo "-------------WITH REPO NO COMMITS------------"
tigger-init
tigger-log
echo ""

echo "-------------WRONG USAGE------------"
tigger-log a b c
echo ""

echo "-------------WITH 1 & 2 COMMITS------------"
rm -f a b c
touch a b c
tigger-add a 
tigger-commit -m 'commit a'
tigger-log
tigger-add b 
tigger-commit -m 'commit b'
tigger-log
tigger-add c 
tigger-commit -m 'commit c'
tigger-log
echo ""


#different names same content
echo "-------------RECOMMITTED EDITED FILE------------"
echo "a" > a
tigger-add a 
tigger-commit -m 'commit a edited'
tigger-log
echo ""


