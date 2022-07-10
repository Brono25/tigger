#!/bin/dash


# ==============================================================================
# test01.sh
#
# Testing tigger-init
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

mkdir tmp
cd tmp


#-------------WRONG USAGE------------
(
tigger-init -g wrong usage 
tigger-init  wrong usage
echo "$?" 1>&2
) 2> "$output" 
cat > "$expected_output" << eof
usage: tigger-init
usage: tigger-init
1
eof
test_outcome "$output" "$expected_output"


#-------------GIT PRESENT------------
(
mkdir '.git'
tigger-init 
echo "$?" 1>&2
rm -r '.git'
) 2> "$output" 
cat > "$expected_output" << eof
tigger-init: error: can not run tigger because .git present in current directory
1
eof
test_outcome "$output" "$expected_output"


# #-------------INITIALISE tigger------------
(
tigger-init
echo "$?"
) 1> "$output" 
cat > "$expected_output" << eof
Initialized empty tigger repository in .tigger
0
eof
test_outcome "$output" "$expected_output"



#-------------WRONG USAGE AFTER INIT------------
(
tigger-init -g wrong_usage
tigger-init  wrong usage
echo "$?" 1>&2
) 2> "$output" 
cat > "$expected_output" << eof
usage: tigger-init
usage: tigger-init
1
eof
test_outcome "$output" "$expected_output"



#-------------REPO EXISTS------------
(
tigger-init
echo "$?" 1>&2
) 2> "$output" 
cat > "$expected_output" << eof
tigger-init: error: .tigger already exists
1
eof


cd ..
rm -rf tmp




