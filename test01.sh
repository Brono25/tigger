#!/bin/dash


PATH=$PATH:.


trap 'rm -r delete' EXIT INT


mkdir delete

cd delete



[ -d  'delete' ] && rm -r 'delete'


#wrong usage before init

echo "-------------WRONG USAGE------------"
tigger-init -g wrong_usage
tigger-init  wrong usage
echo "$?"
echo "\n"


echo "-------------INITIALISE tigger------------"
tigger-init
echo "$?"
echo "\n" 


echo "-------------WRONG USAGE AFTER INIT------------"
tigger-init -g wrong_usage
tigger-init  wrong usage
echo "$?"
echo "\n" 

echo "-------------REPO EXISTS------------"
tigger-init
echo "$?"
cd ..