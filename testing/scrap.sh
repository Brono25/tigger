#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger




mkdir delete
cd delete




2041 tigger-init

touch a b c
echo stuff > a
2041 tigger-add a
2041 tigger-commit -m message1

2041 tigger-show ':a'

echo 'more stuff' > a
2041 tigger-commit -a -m  message2


cd ..
rm -rf delete



mkdir delete
cd delete




tigger-init

touch a b c
echo stuff > a
tigger-add a
tigger-commit -m message1

tigger-show ':a'

echo 'more stuff' > a
tigger-commit -a -m  message2


cd ..
rm -rf delete
