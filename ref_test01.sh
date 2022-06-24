#!/bin/dash




trap 'rm -r .tigger delete' EXIT INT


mkdir delete

cd delete

[ -d  '.tigger' ] && rm -r '.tigger'


#wrong usage before init

echo "-------------WRONG USAGE------------"
2041 tigger-init -g wrong_usage
2041 tigger-init  wrong usage
echo "$?"
echo "\n"


echo "-------------INITIALISE tigger------------"
2041 tigger-init
echo "$?"
echo "\n" 


echo "-------------WRONG USAGE AFTER INIT------------"
2041 tigger-init -g wrong_usage
2041 tigger-init  wrong usage
echo "$?"
echo "\n" 

echo "-------------REPO EXISTS------------"
2041 tigger-init
echo "$?"
cd ..