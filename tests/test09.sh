#!/bin/dash

# ==============================================================================
# test09.sh
# Testing tigger-branch
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

#------------NO REPO------------
(
tigger-branch
echo "$?" 1>&2 
) 2> "$output"
cat > "$expected_output" << eof
tigger-branch: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"



# ----------------BAD USAGE------------"
(
tigger-init > /dev/null
tigger-branch -dw wrong
tigger-branch -w wrong
tigger-branch -d wrong
tigger-branch
echo "$?" 1>&2 
) 2> "$output"
cat > "$expected_output" << eof
tigger-branch: error: this command can not be run until after the first commit
tigger-branch: error: this command can not be run until after the first commit
tigger-branch: error: this command can not be run until after the first commit
tigger-branch: error: this command can not be run until after the first commit
1
eof
test_outcome "$output" "$expected_output"



# ----------------PRINT BRANCHES------------"
(
tigger-branch
touch a b c
tigger-add a b
tigger-commit -m 'first commit' > /dev/null
tigger-branch b1
tigger-branch 1>&2 
tigger-branch -d b1 1>&2 
tigger-branch 1>&2 

echo "$?" 1>&2 
) 2> "$output"
cat > "$expected_output" << eof
tigger-branch: error: this command can not be run until after the first commit
b1
master
Deleted branch 'b1'
master
0
eof
test_outcome "$output" "$expected_output"




#----------------CREATE BRANCH WITHOUT COMMITS------------
(
restart
tigger-branch b1  
echo "Exit status: $?" 1>&2 
echo x > a
tigger-branch b2  
echo "Exit status: $?" 1>&2 
tigger-add a 
tigger-branch b3  
echo "Exit status: $?" 1>&2 

) 2> "$output"
cat > "$expected_output" << eof
tigger-branch: error: this command can not be run until after the first commit
Exit status: 1
tigger-branch: error: this command can not be run until after the first commit
Exit status: 1
tigger-branch: error: this command can not be run until after the first commit
Exit status: 1
eof
test_outcome "$output" "$expected_output"



#----------------CREATE BRANCH WITHOUT NEW COMMITS------------
(
restart
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 
echo "Exit status: $?" 1>&2 
tigger-branch b2 
echo "Exit status: $?" 1>&2 
tigger-branch     1>&2 
echo "Exit status: $?" 1>&2 

) 2> "$output"
cat > "$expected_output" << eof
Exit status: 0
Exit status: 0
b1
b2
master
Exit status: 0
eof
test_outcome "$output" "$expected_output"



#----------------CREATE BRANCHS-----------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 b2 b3 b4
tigger-branch  1>&2 
) 2> "$output"

cat > "$expected_output" << eof
usage: tigger-branch [-d] <branch>
master
eof
test_outcome "$output" "$expected_output"




#----------------CREATE DUPLICATE MASTER------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch master   1>&2  
echo "Exit status: $?"  1>&2 
tigger-branch  1>&2 
echo "Exit status: $?"  1>&2 
) 2> "$output"

cat > "$expected_output" << eof
tigger-branch: error: branch 'master' already exists
Exit status: 1
master
Exit status: 0
eof
test_outcome "$output" "$expected_output"




#----------------CREATE DUPLICATE BRANCH------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1  1>&2 
echo "Exit status: $?" 1>&2 
tigger-branch b1  1>&2 
echo "Exit status: $?" 1>&2 
tigger-branch   1>&2  
echo "Exit status: $?" 1>&2 
) 2> "$output"

cat > "$expected_output" << eof
Exit status: 0
tigger-branch: error: branch 'b1' already exists
Exit status: 1
b1
master
Exit status: 0
eof
test_outcome "$output" "$expected_output"



#----------------DELETE BRANCH------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 b3 b2 b4 
echo "Exit status: $?"  
tigger-branch 
tigger-branch -d b3 b4 
echo "Exit status: $?" 1>&2
tigger-branch 
) 2> "$output" 1>> "$output"

cat > "$expected_output" << eof
usage: tigger-branch [-d] <branch>
usage: tigger-branch [-d] <branch>
Exit status: 1
master
eof
test_outcome "$output" "$expected_output"



# ----------------DELETE BRANCH MASTER------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch -d master
) 2> "$output" 1>> "$output"

cat > "$expected_output" << eof
tigger-branch: error: can not delete branch 'master'
eof
test_outcome "$output" "$expected_output"



# ----------------DO BRANCHES DELETE IF ONE ERRORS------------"
(
restart
echo x > a
tigger-add a
tigger-commit -m 'first commit' 1>/dev/null
tigger-branch b1 b2 b3 b4
tigger-checkout b4
tigger-branch 
tigger-branch -d b1 x b2 b3
tigger-branch 
) 2> "$output" 1>> "$output"

cat > "$expected_output" << eof
usage: tigger-branch [-d] <branch>
tigger-checkout: error: unknown branch 'b4'
usage: tigger-branch [-d] <branch>
master
eof
test_outcome "$output" "$expected_output"






cd ..
rm -fr del







