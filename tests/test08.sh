#!/bin/dash

# ==============================================================================
# test08.sh
# Testing tigger-checkout. Checking-out from every file state.
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
tigger-checkout
echo "$?" 1>&2 
) 2> "$output"
cat > "$expected_output" << eof
tigger-checkout: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"


#--------------WRONG USAGE------------"
(
tigger-init >/dev/null
touch a b c
tigger-add a b c
tigger-commit -m 'a' >/dev/null
tigger-checkout a b c  
tigger-checkout    
echo "$?" 1>&2

) 2> "$output"
cat > "$expected_output" << eof
usage: tigger-checkout <branch>
usage: tigger-checkout <branch>
1
eof
test_outcome "$output" "$expected_output"



# #--------------CHECKOUT UNKNOWN BRANCH------------"
(
tigger-checkout b1  
echo "$?" 1>&2

) 2> "$output"
cat > "$expected_output" << eof
tigger-checkout: error: unknown branch 'b1'
1
eof
test_outcome "$output" "$expected_output"



#--------------PWD_ONLY------------"

(
restart
echo 1 > c 
tigger-add c
tigger-commit -m "commit 0"  > /dev/null
tigger-rm --force c 
echo 1 > a
echo 2 > b

tigger-branch b1  > /dev/null
tigger-checkout b1 > /dev/null
rm a
echo 2 > c 
tigger-add c
tigger-commit -m "commit 1" > /dev/null
tigger-rm --force c 
echo 2 > a
echo 2 > b

tigger-checkout master 
echo "$?" 1>&2

) 2> "$output"
cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
c
1
eof
test_outcome "$output" "$expected_output"



# #--------------INDEX_ONLY------------"
(
restart
echo 1 > c 
tigger-add c
tigger-commit -m "commit 0" > /dev/null
tigger-rm --force c 
echo 1 > a 
echo 1 > b
tigger-add a b 
rm a b
tigger-branch b1 > /dev/null
tigger-checkout b1  > /dev/null
echo 2 > c
tigger-add c
tigger-rm --force a b 
tigger-commit -m "commit 1" > /dev/null 
tigger-rm --force c
echo 2 > a 
echo 2 > b
tigger-add a b 
rm a b
tigger-checkout master
echo "$?" 1>&2
) 2> "$output"
cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
c
1
eof
test_outcome "$output" "$expected_output"



# #--------------IND_AND_PWD------------"
(
restart
echo 1 > c 
tigger-add c
tigger-commit -m "commit 0"  > /dev/null
tigger-rm --force c 
echo 1 > a 
echo 1 > b
tigger-add a b 
tigger-branch b1 > /dev/null
tigger-checkout b1 > /dev/null
tigger-rm --force a b
echo 2 > c 
tigger-add c
tigger-commit -m "commit 1"  > /dev/null
tigger-rm --force c
echo 2 > a 
echo 2 > b
tigger-add a b 
tigger-checkout master

echo "$?" 1>&2
) 2> "$output"
cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
c
1
eof
test_outcome "$output" "$expected_output"



#--------------DELTA_IND_PWD------------"
(
restart
echo 1 > a 
echo 1 > b
echo 1 > c 
tigger-add c
tigger-commit -m "commit 0"  > /dev/null
tigger-rm c
tigger-add a b 
echo 2 > a 
echo 2 > b

tigger-branch b1   > /dev/null
tigger-checkout b1 > /dev/null
echo 2 > c 
tigger-add c
tigger-rm --force --cached a b 
tigger-commit -m "commit 1" > /dev/null
tigger-rm --force c 
echo 2 > a 
echo 2 > b
tigger-add a b 
echo 3 > a 
echo 3 > b
tigger-checkout master
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
c
1
eof
test_outcome "$output" "$expected_output"


#--------------REP_ONLY------------"
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0"  > /dev/null
tigger-rm  a b 
tigger-branch b1    > /dev/null
tigger-checkout b1  > /dev/null
echo 2 > a 
echo 2 > b
tigger-add a b
tigger-commit -m "commit 1" > /dev/null
tigger-rm a b 
tigger-checkout master
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
a
b
1
eof
test_outcome "$output" "$expected_output"




#--------------REP_AND_PWD------------"
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0"  > /dev/null
tigger-rm --cached a b 
tigger-branch b1   > /dev/null
tigger-checkout b1 > /dev/null
echo 2 > a 
echo 2 > b
tigger-add a b
tigger-commit -m "commit 1" > /dev/null
tigger-rm --cached a b 
tigger-checkout master
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
a
b
1
eof
test_outcome "$output" "$expected_output"





#--------------DELTA_REP_PWD------------"
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0"  > /dev/null
tigger-rm --cached a b 
tigger-branch b1 > /dev/null
tigger-checkout b1 > /dev/null
echo 2 > a 
echo 2 > b
tigger-add a b
tigger-commit -m "commit 1" > /dev/null
tigger-rm --cached a b 
tigger-checkout master
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
a
b
1
eof
test_outcome "$output" "$expected_output"


# #--------------REP_AND_IND------------"
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0"  
rm a b
tigger-branch b1 
tigger-checkout b1
echo 2 > a 
echo 2 > b
tigger-add a b
tigger-commit -m "commit 1"
rm a b
tigger-checkout master
echo "$?"
) 1> "$output"

cat > "$expected_output" << eof
Committed as commit 0
Switched to branch 'b1'
Committed as commit 1
Switched to branch 'master'
0
eof
test_outcome "$output" "$expected_output"

#--------------DELTA_REP_IND------------"
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0"  > /dev/null
echo 2 > a 
echo 2 > b
tigger-add a b
rm a b
tigger-branch b1  > /dev/null
tigger-checkout b1 > /dev/null
tigger-commit -m "commit 1" > /dev/null
echo 3 > a 
echo 3 > b
tigger-add a b
rm a b
tigger-checkout master
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
a
b
1
eof
test_outcome "$output" "$expected_output"


#--------------ALL_SAME------------"
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0" 
tigger-branch b1 
tigger-checkout b1 
echo 2 > a 
echo 2 > b
tigger-add a b
tigger-commit -m "commit 1"  
tigger-checkout master
echo "$?" 
) > "$output"

cat > "$expected_output" << eof
Committed as commit 0
Switched to branch 'b1'
Committed as commit 1
Switched to branch 'master'
0
eof
test_outcome "$output" "$expected_output"



#--------------DELTA_IND_PWD_DELTA_REP_PWD------------"
(
restart
echo 1 > a 
echo 1 > 'b_file'
tigger-add a 'b_file'
tigger-commit -m "commit 0" > /dev/null
tigger-branch b1 > /dev/null
tigger-checkout b1 > /dev/null
echo 2 > a
echo 2 > 'b_file'
tigger-add a 'b_file'
tigger-checkout master  > /dev/null
tigger-commit -m "commit 1" > /dev/null
echo 3 > a
echo 3 > 'b_file'
tigger-checkout b1
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
a
b_file
1
eof
test_outcome "$output" "$expected_output"



#--------------DELTA_REP_IND_DELTA_REP_PWD------------"
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0"  > /dev/null
echo 2 > a 
echo 2 > b
tigger-add a b  > /dev/null
tigger-branch b1 > /dev/null
tigger-checkout b1 > /dev/null
tigger-commit -m "commit 1" > /dev/null
echo 3 > a 
echo 3 > b
tigger-add a b
tigger-checkout master 
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
a
b_file
1
eof





#--------------DELTA_REP_IND_DELTA_IND_PWD------------"
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0"  > /dev/null
echo 2 > a 
echo 2 > b
tigger-add a b
echo 1 > a 
echo 1 > b
tigger-branch b1 > /dev/null
tigger-checkout b1 > /dev/null
tigger-commit -m "commit 1"  > /dev/null
echo 3 > a 
echo 3 > b
tigger-add a b
echo 2 > a 
echo 2 > b
tigger-checkout master 
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
a
b_file
1
eof

#--------------ALL_DIFFERENT------------
(
restart
echo 1 > a 
echo 1 > b
tigger-add a b
tigger-commit -m "commit 0"  > /dev/null
echo 2 > a 
echo 2 > b
tigger-add a b
echo 3 > a 
echo 3 > b
tigger-branch b1 > /dev/null
tigger-checkout b1 > /dev/null
tigger-commit -m "commit 1" > /dev/null
tigger-add a b
echo 4 > a 
echo 4 > b
tigger-checkout master
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-checkout: error: Your changes to the following files would be overwritten by checkout:
a
b
1
eof




cd ..
rm -fr del







































