#!/bin/dash
PATH=$PATH:/import/cage/3/z5146619/tigger

. ./test_functions.sh


mkdir delete
cd delete





2041 tigger-init

echo 1 >a
echo 2 >b
echo 3 >c

2041 tigger-add a b c
2041 tigger-commit -m "first commit"

echo 4 >>a
echo 5 >>b
echo 6 >>c
echo 7 >d
echo 8 >e
2041 tigger-add b c d
echo 9 >b
2041 tigger-rm a

# 2041 tigger-rm b

# 2041 tigger-rm c

# 2041 tigger-rm d

# 2041 tigger-rm e

# 2041 tigger-rm --cached a
# 2041 tigger-rm --cached b

# 2041 tigger-rm --cached c
# 2041 tigger-rm --cached d
# 2041 tigger-rm --cached e

# 2041 tigger-rm --force a

# 2041 tigger-rm --force b
# 2041 tigger-rm --force c

# 2041 tigger-rm --force d

# 2041 tigger-rm --force e










echo ''

cd ..
rm -rf delete


mkdir delete
cd delete




tigger-init

echo 1 >a
echo 2 >b
echo 3 >c
tigger-add a b c
tigger-commit -m "first commit"

echo 4 >>a
echo 5 >>b
echo 6 >>c
echo 7 >d
echo 8 >e
tigger-add b c d
echo 9 >b
tigger-rm a

# tigger-rm b

# tigger-rm c

# tigger-rm d

# tigger-rm e

# tigger-rm --cached a
# tigger-rm --cached b

# tigger-rm --cached c
# tigger-rm --cached d
# tigger-rm --cached e

# tigger-rm --force a

# tigger-rm --force b
# tigger-rm --force c

# tigger-rm --force d

# tigger-rm --force e










cd ..
rm -rf delete




