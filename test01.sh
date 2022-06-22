#!/bin/dash




#trap 'rm -r .tigger' EXIT INT


[ -d  '.tigger' ] && rm -r '.tigger'


#wrong usage before init

echo "-------------WRONG USAGE------------"
tigger-init -g wrong_usage
./tigger-init  wrong usage
echo "\n"


echo "-------------INITIALISE tigger------------"
./tigger-init
echo "\n" 


echo "-------------WRONG USAGE AFTER INIT------------"
./tigger-init -g wrong_usage
./tigger-init  wrong usage
echo "\n" 

echo "-------------REPO EXISTS------------"
./tigger-init

