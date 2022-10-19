#!/bin/dash
# ==============================================================================
# test01.sh
# Testing tigger-add
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

#"-------------NO REPO------------"
tigger-add  2> "$output" 

cat > "$expected_output" << eof
tigger-add: error: tigger repository directory .tigger not found
eof
test_outcome "$output" "$expected_output"


# -------------WRONG USAGE NO REPO------------"
tigger-add WRONG  2> "$output" 
cat > "$expected_output" << eof
tigger-add: error: tigger repository directory .tigger not found
eof
test_outcome "$output" "$expected_output"


#-------------WRONG USAGE WITH REPO------------"
tigger-init 1>"$output"
tigger-add WRONG 2>> "$output"
cat > "$expected_output" << eof
Initialized empty tigger repository in .tigger
tigger-add: error: can not open 'WRONG'
eof
test_outcome "$output" "$expected_output"


#-------------ADD FILES------------
echo x > a 
echo x > b
tigger-add a b >  "$output" 
tigger-show :a >> "$output" 
tigger-show :b >> "$output" 
cat > "$expected_output" << eof
x
x
eof
test_outcome "$output" "$expected_output"


#-------------ADD NON-REGULAR FILE------------
mkdir c
tigger-add c 2> "$output" 
cat > "$expected_output" << eof
tigger-add: error: 'c' is not a regular file
eof
test_outcome "$output" "$expected_output"
rm -rf c


# echo "-------------ADD REGULAR THEN NON-REGULAR FILE------------"
echo x |tee a b  1>/dev/null
mkdir k 
tigger-add a k b 2> "$output"
cat > "$expected_output" << eof
tigger-add: error: 'k' is not a regular file
eof
test_outcome "$output" "$expected_output"
rm -rf k


#-------------ADD NON-EXISTENT FILE------------
tigger-add z 2> "$output"
cat > "$expected_output" << eof
tigger-add: error: can not open 'z'
eof
test_outcome "$output" "$expected_output"


cd ..
rm -fr 'tmp'

















