#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger




mkdir delete
cd delete




2041 tigger-init

echo stuff > a

2041 tigger-add a
2041 tigger-commit -m message1


2041 tigger-rm --cached a

2041 tigger-rm --cached a

cd ..
rm -rf delete





