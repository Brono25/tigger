#!/bin/dash

# ==============================================================================
# test010.sh
# Testing tigger-merge
#
# 
# ==============================================================================


PATH="$PATH:$(pwd)"


[ -d 'tmp' ] && rm -rf 'tmp'

output="$(mktemp)"
stderr="$(mktemp)"
stdout="$(mktemp)"
expected_output="$(mktemp)"


trap 'rm -f $output $expected_output $stdout $stderr' EXIT INT


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
tigger-merge
echo "$?" 1>&2 
) 2> "$output"
cat > "$expected_output" << eof
tigger-merge: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"



#-------------WRONG USAGE ------------"
(
tigger-init
touch a 
tigger-add a
tigger-commit -m commit-1
tigger-merge 
tigger-merge b1
tigger-merge b1 -m 
tigger-merge b1 -ma m2 
tigger-merge -m m3
tigger-merge b1 -m m4 m5
tigger-merge b1 b2 -m m4 m5
) 2> "$output" >> "$output"
cat > "$expected_output" << eof
usage: tigger-merge <branch|commit> -m message
tigger-merge: error: empty commit message
usage: tigger-merge <branch|commit> -m message
usage: tigger-merge <branch|commit> -m message
usage: tigger-merge <branch|commit> -m message
usage: tigger-merge <branch|commit> -m message
usage: tigger-merge <branch|commit> -m message
eof
test_outcome "$output" "$expected_output"



#-------------UNKOWN BRANCH------------"
(
restart
touch a 
tigger-add a
tigger-commit -m commit-1 >/dev/null
tigger-merge b1 -m m1
)  2> "$output" 
cat > "$expected_output" << eof
tigger-merge: error: unknown branch 'b1'
eof
test_outcome "$output" "$expected_output"


#-------------MERGE BRANCH WITH ITSELF------------"
(
restart
touch a 
tigger-add a
tigger-commit -m commit-1
tigger-merge master -m m1
tigger-branch b1
tigger-checkout b1
tigger-merge b1 -m m1
tigger-merge master -m m1

) 2> "$stderr" 1> "$stdout"
cat "$stderr" "$stdout" > "$output"
cat > "$expected_output" << eof
Committed as commit 0
Already up to date
Switched to branch 'b1'
Already up to date
Already up to date
eof
test_outcome "$output" "$expected_output"





#-------------MERGE BRANCH NO COMMITS------------"
(
restart
touch a 
tigger-add a
tigger-commit -m commit-1
tigger-merge master -m m1
tigger-branch b1
tigger-checkout b1
tigger-merge b1 -m m1
tigger-merge master -m m1

) 2> "$stderr" 1> "$stdout"
cat "$stderr" "$stdout" > "$output"
cat > "$expected_output" << eof
Committed as commit 0
Already up to date
Switched to branch 'b1'
Already up to date
Already up to date
eof
test_outcome "$output" "$expected_output"



# #-------------FAST FORWARD MASTER------------"
(
restart
touch a 
tigger-add a
tigger-commit -m commit-0
tigger-branch b1
tigger-checkout b1
tigger-merge master -m m1
touch b  
tigger-add b
tigger-commit -m commit-1
tigger-branch b2
tigger-checkout b2
touch c
rm a b
tigger-add a b c
tigger-commit -m commit-2
tigger-checkout master
tigger-merge b1 -m m1

) 2> "$stderr" 1> "$stdout"
cat "$stderr" "$stdout" > "$output"
cat > "$expected_output" << eof
Committed as commit 0
Switched to branch 'b1'
Already up to date
Committed as commit 1
Switched to branch 'b2'
Committed as commit 2
Switched to branch 'master'
Fast-forward: no commit created
eof
test_outcome "$output" "$expected_output"





#-------------MERGE MASTER B1 TO B2 NO CONFLICT------------"
(
restart
touch a 
tigger-add a 
tigger-commit -m commit-0
tigger-branch b2
tigger-branch b1
tigger-checkout b1
touch b
tigger-add b
tigger-commit -m commit-1
touch c
rm a b
tigger-add a b c
tigger-commit -m commit-2
touch d
tigger-add d
tigger-commit -m commit-3
tigger-checkout b2
touch e
tigger-add e
tigger-rm a
tigger-commit -m commit-4
touch f
tigger-add f
tigger-commit -m commit-5
tigger-checkout b1
tigger-merge b2 -m m2
)  > "$output" 

cat > "$expected_output" << eof
Committed as commit 0
Switched to branch 'b1'
Committed as commit 1
Committed as commit 2
Committed as commit 3
Switched to branch 'b2'
Committed as commit 4
Committed as commit 5
Switched to branch 'b1'
Committed as commit 6
eof
test_outcome "$output" "$expected_output"




# -------------FAST FORWARD B1 TO MASTER------------"
(
restart
touch a 
tigger-add a
tigger-commit -m commit-0
tigger-branch b2
tigger-branch b1
tigger-checkout b1
touch b
tigger-add b
tigger-commit -m commit-1
touch c
rm a b
tigger-add a b c
tigger-commit -m commit-2
touch d
tigger-add d
tigger-commit -m commit-3
tigger-checkout b2
touch e
tigger-add e
tigger-commit -m commit-4
touch f
tigger-add f
tigger-commit -m commit-5
tigger-checkout b1
tigger-merge master -m m2
tigger-checkout master
tigger-merge b1 -m m1

) 2> "$stderr" 1> "$stdout"
cat "$stderr" "$stdout" > "$output"
cat > "$expected_output" << eof
Committed as commit 0
Switched to branch 'b1'
Committed as commit 1
Committed as commit 2
Committed as commit 3
Switched to branch 'b2'
Committed as commit 4
Committed as commit 5
Switched to branch 'b1'
Already up to date
Switched to branch 'master'
Fast-forward: no commit created
eof
test_outcome "$output" "$expected_output"




