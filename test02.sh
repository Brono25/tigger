#!/bin/dash


# ==============================================================================
# test02.sh
# Testing tigger-commit
#
# 
# ==============================================================================


PATH="$PATH:$(pwd)"


[ -d 'tmp' ] && rm -rf 'tmp'

output="$(mktemp)"
expected_output="$(mktemp)"


trap 'rm -f $output $expected_output' EXIT INT


test_outcome()
{
	if ! diff "$1" "$2"
	then
    	echo "Failed test"
    	exit 1
    else
    	echo "Pass"
	fi
}
restart()
{
	rm -f *
	rm -fr '.tigger'
	tigger-init 1>/dev/null
}


mkdir tmp
cd tmp

#"-------------NO REPO------------" 
tigger-commit 2> "$output" 
echo $? >> "$output" 

cat > "$expected_output" << eof
tigger-commit: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"


#-------------WRONG USAGE ------------
tigger-init  > /dev/null
tigger-commit a b c    2>"$output" 
tigger-commit a a b c  2>>"$output" 
cat > "$expected_output" << eof
usage: tigger-commit [-a] -m commit-message
usage: tigger-commit [-a] -m commit-message
eof
test_outcome "$output" "$expected_output"


#-------------EMPTY COMMIT------------
tigger-commit -m my first commit    1>"$output"
tigger-commit -am 'my first commit' 1>>"$output"
cat > "$expected_output" << eof
nothing to commit
nothing to commit
eof
test_outcome "$output" "$expected_output"



#------------------INDEX_ONLY------------"
restart
(
echo x > a
tigger-add a
rm -f a
tigger-commit -m 'my first commit' 
echo "Exit status: $?"
tigger-log 

echo x > b
tigger-add b
rm -f b
tigger-commit -a -m 'my first commit' 
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
Exit status: 0
0 my first commit
Committed as commit 1
Exit status: 0
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"


#-------------------IND_AND_PWD------------"
# 
(
restart
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
echo "Exit status: $?"
tigger-log 
echo x > b
tigger-add b
tigger-commit -am 'my first commit'
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
Exit status: 0
0 my first commit
Committed as commit 1
Exit status: 0
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"



#-------------------DELTA_IND_PWD------------"
(
restart
echo x > a
tigger-add a
echo xx > a
tigger-commit -m 'my first commit' 
echo "Exit status: $?"
tigger-log 
echo x > b
tigger-add b
echo xx > b
tigger-commit -am 'my first commit' 
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
Exit status: 0
0 my first commit
Committed as commit 1
Exit status: 0
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"

#-------------------REP_ONLY------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
tigger-rm --cached a
rm -f a
tigger-commit -m 'my first commit' 
echo "Exit status: $?"
tigger-log 
echo x > b
tigger-add b
tigger-commit -m 'my first commit' 
tigger-rm --cached b
rm -f b
tigger-commit -am 'my first commit' 
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
Committed as commit 1
Exit status: 0
1 my first commit
0 my first commit
Committed as commit 2
Committed as commit 3
Exit status: 0
3 my first commit
2 my first commit
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"

#-------------------REP_AND_PWD------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
tigger-rm --cached a
tigger-commit -m 'my first commit' 
echo "Exit status: $?"
tigger-log 
echo x > b
tigger-add b
tigger-commit -m 'my first commit' 
tigger-rm --cached b
tigger-commit -am 'my first commit' 
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
Committed as commit 1
Exit status: 0
1 my first commit
0 my first commit
Committed as commit 2
Committed as commit 3
Exit status: 0
3 my first commit
2 my first commit
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"


#-------------------DELTA_REP_PWD------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
tigger-rm --cached a
echo xx > a
tigger-commit -m 'my first commit' 
echo "Exit status: $?"
tigger-log 

echo x > b
tigger-add b
tigger-commit -m 'my first commit' 
tigger-rm --cached b
echo xx > b
tigger-commit -am 'my first commit' 
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
Committed as commit 1
Exit status: 0
1 my first commit
0 my first commit
Committed as commit 2
Committed as commit 3
Exit status: 0
3 my first commit
2 my first commit
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"


#-----------------REP_AND_IND------------
(
restart
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
rm a
tigger-commit -m 'my first second'
tigger-log 

echo x > b
tigger-add b
tigger-commit -m 'my first commit' 
rm b
tigger-commit -am 'my first second'
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
nothing to commit
0 my first commit
Committed as commit 1
Committed as commit 2
2 my first second
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"



#-------------------DELTA_REP_IND------------
(
restart
echo x > a
tigger-add a
echo xx > a
tigger-commit -m 'my first commit' 
echo "Exit status: $?"
tigger-log 

echo x > b
tigger-add b
echo xx > b
tigger-commit -am 'my first commit' 
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
Exit status: 0
0 my first commit
Committed as commit 1
Exit status: 0
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"


#-------------------ALL_SAME------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
tigger-commit -m 'my second commit' 
echo "Exit status: $?"
tigger-log 

echo x > b
tigger-add b
tigger-commit -m 'my first commit' 
tigger-commit -am 'my second commit' 
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
nothing to commit
Exit status: 0
0 my first commit
Committed as commit 1
nothing to commit
Exit status: 0
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"


#------------------DELTA_IND_PWD_DELTA_REP_PWD------------
(
restart
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
echo xx > a
tigger-commit -m 'my second commit' 
echo "Exit status: $?"
tigger-log 

echo x > b
tigger-add b
tigger-commit -m 'my first commit' 
echo xx > b
tigger-commit -am 'my second commit' 
echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
nothing to commit
Exit status: 0
0 my first commit
Committed as commit 1
Committed as commit 2
Exit status: 0
2 my second commit
1 my first commit
0 my first commit
eof
test_outcome "$output" "$expected_output"



#-------------------DELTA_REP_IND_DELTA_REP_PWD------------
(
restart
echo x > a
tigger-add a
tigger-commit -m 'my first commit' 
echo xx > a
tigger-add a
tigger-commit -m 'my second commit' ;echo "Exit status: $?"
tigger-log 

echo x > b
tigger-add b
tigger-commit -m 'my first commit' 
echo xx > b
tigger-add b
tigger-commit -am 'my second commit' ;echo "Exit status: $?"
tigger-log 
) 1>"$output"

cat > "$expected_output" << eof
Committed as commit 0
Committed as commit 1
Exit status: 0
1 my second commit
0 my first commit
Committed as commit 2
Committed as commit 3
Exit status: 0
3 my second commit
2 my first commit
1 my second commit
0 my first commit
eof
test_outcome "$output" "$expected_output"


# #REP = PWD
#-------------------DELTA_REP_IND_DELTA_IND_PWD------------"
# 
# echo x > a
# tigger-add a
# tigger-commit -m 'my first commit' 1>/dev/null
# echo xx > a
# tigger-add a
# echo x > a

#  0
# tigger-commit -m 'my second commit' ;echo "Exit status: $?"
#  1

# tigger-log 
# 

# 
# echo x > a
# tigger-add a
# tigger-commit -m 'my first commit' 1>/dev/null
# echo xx > a
# tigger-add a
# echo x > a

#  0
# tigger-commit -am 'my second commit' ;echo "Exit status: $?"
#  0

# tigger-log 
# 


#-------------------ALL_DIFFERENT------------"
# 
# echo x > a
# tigger-add a
# tigger-commit -m 'my first commit' 1>/dev/null
# echo xx > a
# tigger-add a
# echo xxx > a

#  0
# tigger-commit -m 'my second commit' ;echo "Exit status: $?"
#  1

# tigger-log 
# 

# 
# echo x > a
# tigger-add a
# tigger-commit -m 'my first commit' 1>/dev/null
# echo xx > a
# tigger-add a
# echo xxx > a

#  0
# tigger-commit -am 'my second commit' ;echo "Exit status: $?"
#  1

# tigger-log 
# 


# # #-------------------EMPTY COMMIT AFTER INITIAL COMMIT------------"
# # # 
# # # echo x > a
# # # tigger-add a 
# # # tigger-commit -m 'first commit' 1>/dev/null

# # # tigger-branch.sh b1 
# # # tigger-checkout.sh b1

# # # tigger-rm a 
# # # tigger-commit -m 'first commit' 1>/dev/null

# # # 
# # # 






cd ..
rm -rf tmp









































