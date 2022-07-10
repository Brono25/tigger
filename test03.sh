#!/bin/dash


# ==============================================================================
# test03.sh
#
# Testing tigger-log usage
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



#-------------NO REPO------------
(
tigger-log -g wrong usage 
echo "$?" 1>&2
) 2> "$output" 
cat > "$expected_output" << eof
tigger-log: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"


#-------------WITH REPO NO COMMITS------------"
(
tigger-init
tigger-log
echo "$?" 
) > "$output" 
cat > "$expected_output" << eof
Initialized empty tigger repository in .tigger
0
eof
test_outcome "$output" "$expected_output"

#-------------WRONG USAGE------------"
(
tigger-log a b c
echo "$?" 1>&2
) 2> "$output" 
cat > "$expected_output" << eof
usage: tigger-log
1
eof
test_outcome "$output" "$expected_output"

#-------------WITH 1 & 2 COMMITS------------"
(
touch a b c
tigger-add a 
tigger-commit -m 'commit a'
tigger-log
tigger-add b 
tigger-commit -m 'commit b'
tigger-log
tigger-add c 
tigger-commit -m 'commit c'
tigger-log
rm -f a b c
) > "$output" 
cat > "$expected_output" << eof
Committed as commit 0
0 commit a
Committed as commit 1
1 commit b
0 commit a
Committed as commit 2
2 commit c
1 commit b
0 commit a
eof
test_outcome "$output" "$expected_output"


#-------------RECOMMITTED EDITED FILE------------"
restart
(
echo x > a
tigger-add a 
tigger-show :a
echo xx > a
tigger-commit -m 'commit a edited'
tigger-log
tigger-show :a

) > "$output" 
cat > "$expected_output" << eof
x
Committed as commit 0
0 commit a edited
x
eof
test_outcome "$output" "$expected_output"


cd ..
rm -rf tmp


























