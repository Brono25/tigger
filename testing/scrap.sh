#!/bin/dash

#trap 'rm -rf .tigger' EXIT INT

[ -d  '.tigger' ] && rm -fr '.tigger'


2041 tigger-init


2041 tigger-add  run_test.sh
2041 tigger-commit -m ' commit 1'

2041 tigger-show ":a"


rm -fr '.tigger'



tigger-init
tigger-add  run_test.sh
tigger-commit -m ' commit 1'

tigger-show ":a"
