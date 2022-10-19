#!/bin/dash

# ==============================================================================
# test05.sh
# Testing tigger-show
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


mkdir tmp
cd tmp


#------------NO REPO------------
(
tigger-show NULL:a
echo "$?" 1>&2
) 2> "$output"
cat > "$expected_output" << eof
tigger-show: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"



#------------WRONG USAGE NO REPO------------"
(
tigger-show - WRONG - USAGE
echo "$?" 1>&2
) 2> "$output"
cat > "$expected_output" << eof
tigger-show: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"


# #------------WRONG USAGE WITH REPO------------"
(
tigger-init 1>&2
tigger-show 'a' ':'
tigger-show x::a 
echo "$?" 1>&2
tigger-show 0a 
echo "$?" 1>&2
tigger-show 0:a 
echo "$?" 1>&2
tigger-show :a 
echo "$?" 1>&2
tigger-show : 
echo "$?" 1>&2
tigger-show s:0:b:v 
echo "$?" 1>&2
) 2> "$output"
cat > "$expected_output" << eof
Initialized empty tigger repository in .tigger
usage: tigger-show <commit>:<filename>
tigger-show: error: unknown commit 'x'
1
tigger-show: error: invalid object 0a
1
tigger-show: error: unknown commit '0'
1
tigger-show: error: 'a' not found in index
1
tigger-show: error: invalid filename ''
1
tigger-show: error: unknown commit 's'
1
eof
test_outcome "$output" "$expected_output"

# #------------WITH ONE COMMMIT------------"
(
echo 'line 1' > a
tigger-add a 
tigger-commit -m 'commit a' 1>&2
tigger-show 0:a 1>&2
echo "$?" 1>&2
tigger-show 0:-file 
echo "$?" 1>&2
tigger-show 0:.file 
echo "$?" 1>&2
tigger-show 0:_file 
echo "$?" 1>&2
tigger-show 0:file- 
echo "$?" 1>&2
tigger-show 0:file_c 
echo "$?" 1>&2
tigger-show 0:file.c 
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
Committed as commit 0
line 1
0
tigger-show: error: invalid filename '-file'
1
tigger-show: error: invalid filename '.file'
1
tigger-show: error: invalid filename '_file'
1
tigger-show: error: 'file-' not found in commit 0
1
tigger-show: error: 'file_c' not found in commit 0
1
tigger-show: error: 'file.c' not found in commit 0
1
eof
test_outcome "$output" "$expected_output"


#------------WITH TWO COMMMIT------------"
(
echo 'line 2' >> a
tigger-add a 
echo "$?" 1>&2
tigger-commit -m 'commit a again' > /dev/null
echo "$?" 1>&2
tigger-show 0:a 1>&2
echo "$?" 1>&2
tigger-show 1:a 1>&2
echo "$?" 1>&2 
tigger-show :a  1>&2
echo "$?" 1>&2
tigger-show :   1>&2
echo "$?" 1>&2
tigger-show ::  1>&2
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
0
0
line 1
0
line 1
line 2
0
line 1
line 2
0
tigger-show: error: invalid filename ''
1
tigger-show: error: invalid filename ':'
1
eof
test_outcome "$output" "$expected_output"


#------------UNKNOWN COMMMIT------------"
(
tigger-show z:a 
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-show: error: unknown commit 'z'
1
eof
test_outcome "$output" "$expected_output"


#------------FILE NOT FOUND------------"
(
tigger-show 0:b
tigger-show :b
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-show: error: 'b' not found in commit 0
tigger-show: error: 'b' not found in index
1
eof
test_outcome "$output" "$expected_output"



#-----------NOT IN INDEX------------"
(
echo 'text in d' > d
tigger-add d
tigger-commit -m 'commit d' > /dev/null
tigger-rm --force --cached d
tigger-show 3:d
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-show: error: unknown commit '3'
1
eof
test_outcome "$output" "$expected_output"


cd ..
rm -fr 'tmp'





