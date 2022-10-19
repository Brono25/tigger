#!/bin/dash

# ==============================================================================
# test07.sh
# Testing tigger-status
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
tigger-status
echo "$?" 1>&2 
) 2> "$output"
cat > "$expected_output" << eof
tigger-status: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"


#--------------NO_FILES---------"
(
tigger-init > /dev/null
tigger-status
echo "$?" 1>&2
) 2> "$output"
cat > "$expected_output" << eof
0
eof
test_outcome "$output" "$expected_output"



#--------------BAD USAGE------------"
(
tigger-status bad usage -x
echo "$?" 1>&2
) 2> "$output"
cat > "$expected_output" << eof
0
eof
test_outcome "$output" "$expected_output"




# #--------------EVERY STATUS------------"
(
touch  f x g y h z i s u p o t l r
tigger-add  f x g y h z i s t l r
tigger-commit -m 'first commit' 1> /dev/null
tigger-rm --cached r
touch  e j k
echo x > f
echo x > x
echo x > h
echo x > z
echo x > i  
echo x > s
tigger-add  e j k f x h z i s
rm -f h z l
echo x > g
echo x > y
echo x > j
echo x > k
echo xx > i
echo xx > s
touch h z
tigger-status 
echo "$?"

) 1> "$output"
cat > "$expected_output" << eof
e - added to index
f - file changed, changes staged for commit
g - file changed, changes not staged for commit
h - file changed, different changes staged for commit
i - file changed, different changes staged for commit
j - added to index, file changed
k - added to index, file changed
l - file deleted
o - untracked
p - untracked
r - untracked
s - file changed, different changes staged for commit
t - same as repo
u - untracked
x - file changed, changes staged for commit
y - file changed, changes not staged for commit
z - file changed, different changes staged for commit
0
eof
test_outcome "$output" "$expected_output"



cd ..
rm -fr 'tmp'
