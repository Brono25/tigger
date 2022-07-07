#!/bin/dash




mkdir x
cd x


2041 tigger-init
touch a 
2041 tigger-add a
2041 tigger-commit -m commit-1

2041 tigger-merge b1 -m 



# 2041 tigger-init
# # Initialized empty 2041 tigger repository in .2041 tigger
# seq 1 7 >7.txt
# 2041 tigger-add 7.txt
# 2041 tigger-commit -m commit-1
# # Committed as commit 0
# 2041 tigger-branch b1
# 2041 tigger-checkout b1
# # Switched to branch 'b1'
# perl -pi -e 's/2/42/' 7.txt
# cat 7.txt
# # 1
# # 42
# # 3
# # 4
# # 5
# # 6
# # 7
# 2041 tigger-commit -a -m commit-2
# # Committed as commit 1
# 2041 tigger-checkout master
# # Switched to branch 'master'
# cat 7.txt
# # 1
# # 2
# # 3
# # 4
# # 5
# # 6
# # 7
# 2041 tigger-merge b1 -m merge-message
# # Fast-forward: no commit created
# cat 7.txt
# # 1
# # 42
# # 3
# # 4
# # 5
# # 6
# # 7







cd ..
rm -rdf x