#!/bin/dash

# ==============================================================================
# test05.sh
# Testing tigger-show in every file state according to tigger-file_state
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
tigger-rm
echo "$?" 1>&2 1>&2
) 2> "$output"
cat > "$expected_output" << eof
tigger-rm: error: tigger repository directory .tigger not found
1
eof
test_outcome "$output" "$expected_output"



#---------------WRONG USAGE------------"
(
tigger-init >/dev/null
tigger-rm
echo "$?" 1>&2 1>&2
) 2> "$output"
cat > "$expected_output" << eof
usage: tigger-rm [--force] [--cached] <filenames>
1
eof
test_outcome "$output" "$expected_output"


#---------------NO FILE GIVEN------------"
(
tigger-rm --force  
echo "$?" 1>&2 1>&2
tigger-rm --cached 
echo "$?" 1>&2 1>&2
tigger-rm --force  --cached
echo "$?" 1>&2 1>&2

) 2> "$output"
cat > "$expected_output" << eof
usage: tigger-rm [--force] [--cached] <filenames>
1
usage: tigger-rm [--force] [--cached] <filenames>
1
usage: tigger-rm [--force] [--cached] <filenames>
1
eof
test_outcome "$output" "$expected_output"



#---------------PWD_ONLY------------"
(
echo x > a
tigger-rm a
echo "$?" 1>&2 1>&2
tigger-rm --force  a
echo "$?" 1>&2 1>&2
tigger-rm --cached a
echo "$?" 1>&2 1>&2
tigger-rm --force  --cached a
echo "$?" 1>&2 1>&2
) 2> "$output"
cat > "$expected_output" << eof
tigger-rm: error: 'a' is not in the tigger repository
1
tigger-rm: error: 'a' is not in the tigger repository
1
tigger-rm: error: 'a' is not in the tigger repository
1
tigger-rm: error: 'a' is not in the tigger repository
1
eof
test_outcome "$output" "$expected_output"




#---------------INDEX_ONLY------------"
(
echo x > a
tigger-add a 
rm -f a
tigger-rm a 				
echo x > a
tigger-add a 
rm -f a
tigger-show :a 1>&2
tigger-rm --cached a
echo "$?" 1>&2 1>&2
echo x > a
tigger-add a 
rm -f a
tigger-show :a 1>&2
tigger-rm --force a
echo "$?" 1>&2 1>&2
echo x > a
tigger-add a 
rm -f a
tigger-show :a 1>&2
tigger-rm --force --cached a 
echo "$?" 1>&2 1>&2

) 2> "$output"

cat > "$expected_output" << eof
x
0
x
0
x
0
eof
test_outcome "$output" "$expected_output"





#---------------IND_AND_PWD------------
#
(
restart
echo x > a
tigger-add a 
tigger-rm a 
echo "$?" 1>&2 1>&2
echo x > a
tigger-add a 
tigger-rm --cached a 
echo "$?" 1>&2 1>&2
echo x > a
tigger-add a 
tigger-rm --force a 
echo "$?" 1>&2 1>&2
echo x > a
tigger-add a 
tigger-rm --force --cached a 
echo "$?" 1>&2 1>&2

) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' has staged changes in the index
1
0
0
0
eof
test_outcome "$output" "$expected_output"






#---------------DELTA_IND_PWD------------"
# 
(
restart
echo x > a
tigger-add a 
echo xx > a
tigger-rm a 
echo "$?" 1>&2 1>&2
echo x > a
tigger-add a 
echo xx > a
tigger-rm --cached a  
echo "$?" 1>&2 1>&2
echo x > a
tigger-add a 
echo xx > a
tigger-rm --force a 
echo "$?" 1>&2 1>&2
echo x > a
tigger-add a 
echo xx > a
tigger-rm --force --cached a 
echo "$?" 1>&2 1>&2

) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' in index is different to both the working file and the repository
1
tigger-rm: error: 'a' in index is different to both the working file and the repository
1
0
0
eof
test_outcome "$output" "$expected_output"


#---------------REP_ONLY------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
tigger-rm --cached a 1>/dev/null
rm -f a

tigger-rm a 
tigger-rm --force a 
tigger-rm --cached a 
tigger-rm --force  --cached a

) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
eof
test_outcome "$output" "$expected_output"




#---------------REP_AND_PWD------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
tigger-rm --cached a 1>/dev/null

tigger-rm a 
tigger-rm --force a 
tigger-rm --cached a 
tigger-rm --force  --cached a

) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
eof
test_outcome "$output" "$expected_output"




#---------------DELTA_REP_PWD------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
tigger-rm --cached a 1>/dev/null
echo ff > a

tigger-rm a 
tigger-rm --force a 
tigger-rm --cached a 
tigger-rm --force  --cached a

) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
tigger-rm: error: 'a' is not in the tigger repository
eof
test_outcome "$output" "$expected_output"




#---------------REP_AND_IND------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
rm -f a
tigger-rm a 
echo "$?" 1>&2 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
rm -f a
tigger-rm --force a 
echo "$?" 1>&2 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
rm -f a
tigger-rm --cached a
echo "$?" 1>&2 1>&2

echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
rm -f a

tigger-rm --force --cached a 
echo "$?" 1>&2 1>&2

) 2> "$output"

cat > "$expected_output" << eof
0
0
0
0
eof
test_outcome "$output" "$expected_output"






#---------------DELTA_REP_IND------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
rm -f a
tigger-rm a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
rm -f a
tigger-rm --force a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
rm -f a
tigger-rm --cached a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
rm -f a
tigger-rm --force --cached a 
echo "$?" 1>&2

) 2> "$output"

cat > "$expected_output" << eof
0
0
0
0
eof
test_outcome "$output" "$expected_output"




#---------------ALL_FOUND------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
tigger-rm a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
tigger-rm --force a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
tigger-rm --cached a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
tigger-rm --force --cached a 
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
0
0
0
0
eof
test_outcome "$output" "$expected_output"


#---------------DELTA_IND_PWD_DELTA_REP_PWD------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-rm a 
echo "$?" 1>&2 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-rm --force a 
echo "$?" 1>&2 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-rm --cached a 
echo "$?" 1>&2 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-rm --force --cached a 
echo "$?" 1>&2 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' in the repository is different to the working file
1
0
0
0
eof
test_outcome "$output" "$expected_output"



#---------------DELTA_REP_IND_DELTA_REP_PWD------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
tigger-rm a 
echo "$?" 1>&2 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
tigger-rm --force a 
echo "$?" 1>&2 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
tigger-rm --cached a 
echo "$?" 1>&2 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
tigger-rm --force --cached a 
echo "$?" 1>&2 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' has staged changes in the index
1
0
0
0
eof
test_outcome "$output" "$expected_output"



#---------------DELTA_REP_IND_DELTA_IND_PWD------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo f > a
tigger-rm a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo f > a
tigger-rm --force a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo f > a
tigger-rm --cached a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo f > a 
tigger-rm --force --cached a 
echo "$?" 1>&2
) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' in index is different to both the working file and the repository
1
0
tigger-rm: error: 'a' in index is different to both the working file and the repository
1
0
eof
test_outcome "$output" "$expected_output"




#---------------ALL_DIFFERENT------------"
(
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo fff > a
tigger-rm a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo fff > a
tigger-rm --force a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo fff > a
tigger-rm --cached a 
echo "$?" 1>&2
echo f > a
tigger-add a 
tigger-commit -m 'a' 1>/dev/null
echo ff > a
tigger-add a 
echo fff > a
tigger-rm --force --cached a 
echo "$?" 1>&2

) 2> "$output"

cat > "$expected_output" << eof
tigger-rm: error: 'a' in index is different to both the working file and the repository
1
0
tigger-rm: error: 'a' in index is different to both the working file and the repository
1
0
eof
test_outcome "$output" "$expected_output"




cd ..
rm -fr 'tmp'