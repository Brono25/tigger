#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


mkdir delete
cd delete



2041 tigger-init

echo hello >a
2041 tigger-add a
2041 tigger-commit -m commit-0

2041 tigger-rm a
2041 tigger-status

2041 tigger-commit -m commit-1

2041 tigger-status
echo world >a
2041 tigger-status

2041 tigger-commit -m commit-2

2041 tigger-add a
2041 tigger-commit -m commit-2

2041 tigger-rm a
2041 tigger-commit -m commit-3

# 2041 tigger-show :a

# 2041 tigger-show 0:a

# 2041 tigger-show 1:a

# 2041 tigger-show 2:a

# 2041 tigger-show 3:a










echo ''

cd ..
rm -rf delete


mkdir delete
cd delete

tigger-init

echo hello >a
tigger-add a
tigger-commit -m commit-0

tigger-rm a
tigger-status

tigger-commit -m commit-1

tigger-status
echo world >a
tigger-status

tigger-commit -m commit-2

tigger-add a
tigger-commit -m commit-2

tigger-rm a
tigger-commit -m commit-3

# tigger-show :a

# tigger-show 0:a

# tigger-show 1:a

# tigger-show 2:a

# tigger-show 3:a








cd ..
rm -rf delete




