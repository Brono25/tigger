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

# #------------NO REPO------------
# (
# tigger-merge
# echo "$?" 1>&2 
# ) 2> "$output"
# cat > "$expected_output" << eof
# tigger-merge: error: tigger repository directory .tigger not found
# 1
# eof
# test_outcome "$output" "$expected_output"



# #-------------WRONG USAGE ------------"
# (
# tigger-init
# touch a 
# tigger-add a
# tigger-commit -m commit-1
# tigger-merge 
# tigger-merge b1
# tigger-merge b1 -m 
# tigger-merge b1 -ma m2 
# tigger-merge -m m3
# tigger-merge b1 -m m4 m5
# tigger-merge b1 b2 -m m4 m5
# ) 2> "$output" >> "$output"
# cat > "$expected_output" << eof
# usage: tigger-merge <branch|commit> -m message
# tigger-merge: error: empty commit message
# usage: tigger-merge <branch|commit> -m message
# usage: tigger-merge <branch|commit> -m message
# usage: tigger-merge <branch|commit> -m message
# usage: tigger-merge <branch|commit> -m message
# usage: tigger-merge <branch|commit> -m message
# eof
# test_outcome "$output" "$expected_output"



# #-------------UNKOWN BRANCH------------"
# (
# restart
# touch a 
# tigger-add a
# tigger-commit -m commit-1 >/dev/null
# tigger-merge b1 -m m1
# )  2> "$output" 
# cat > "$expected_output" << eof
# tigger-merge: error: unknown branch 'b1'
# eof
# test_outcome "$output" "$expected_output"


# #-------------MERGE BRANCH WITH ITSELF------------"
# (
# restart
# touch a 
# tigger-add a
# tigger-commit -m commit-1
# tigger-merge master -m m1
# tigger-branch b1
# tigger-checkout b1
# tigger-merge b1 -m m1
# tigger-merge master -m m1

# ) 2> "$stderr" 1> "$stdout"
# cat "$stderr" "$stdout" > "$output"
# cat > "$expected_output" << eof
# Committed as commit 0
# Already up to date
# Switched to branch 'b1'
# Already up to date
# Already up to date
# eof
# test_outcome "$output" "$expected_output"





# #-------------MERGE BRANCH NO COMMITS------------"
# (
# restart
# touch a 
# tigger-add a
# tigger-commit -m commit-1
# tigger-merge master -m m1
# tigger-branch b1
# tigger-checkout b1
# tigger-merge b1 -m m1
# tigger-merge master -m m1

# ) 2> "$stderr" 1> "$stdout"
# cat "$stderr" "$stdout" > "$output"
# cat > "$expected_output" << eof
# Committed as commit 0
# Already up to date
# Switched to branch 'b1'
# Already up to date
# Already up to date
# eof
# test_outcome "$output" "$expected_output"



# #-------------FAST FORWARD MASTER------------"
# (
# restart
# touch a 
# tigger-add a
# tigger-commit -m commit-0
# tigger-branch b1
# tigger-checkout b1
# tigger-merge master -m m1
# touch b  
# tigger-add b
# tigger-commit -m commit-1
# tigger-branch b2
# tigger-checkout b2
# touch c
# rm a b
# tigger-add a b c
# tigger-commit -m commit-2
# tigger-checkout master
# tigger-merge b1 -m m1

# ) 2> "$stderr" 1> "$stdout"
# cat "$stderr" "$stdout" > "$output"
# cat > "$expected_output" << eof
# Committed as commit 0
# Switched to branch 'b1'
# Already up to date
# Committed as commit 1
# Switched to branch 'b2'
# Committed as commit 2
# Switched to branch 'master'
# Fast-forward: no commit created
# eof
# test_outcome "$output" "$expected_output"



# -------------FAST FORWARD B1 TO MASTER------------"

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




 








# echo "-------------FAST FORWARD MASTER TO B1------------"
# 
# touch a 
# tigger-add a
# tigger-commit -m commit-0

# tigger-branch b2
# tigger-branch b1
# tigger-checkout b1


# touch b
# tigger-add b
# tigger-commit -m commit-1cd ..

# touch c
# rm a b
# tigger-add a b c
# tigger-commit -m commit-2


# touch d
# tigger-add d
# tigger-commit -m commit-3

# tigger-checkout b2




# touch e
# tigger-add e
# tigger-commit -m commit-4

# touch f
# tigger-add f
# tigger-commit -m commit-5


# # 5


# tigger-checkout master
# tigger-merge b1 -m m2

#  5
# 


# echo "-------------MERGE MASTER B1 TO B2 NO CONFLICT------------"
# 
# touch a 
# tigger-add a 
# tigger-commit -m commit-0

# tigger-branch b2
# tigger-branch b1
# tigger-checkout b1


# touch b
# tigger-add b
# tigger-commit -m commit-1

# touch c
# rm a b
# tigger-add a b c
# tigger-commit -m commit-2


# touch d
# tigger-add d
# tigger-commit -m commit-3

# tigger-checkout b2




# touch e
# tigger-add e
# tigger-rm a
# tigger-commit -m commit-4

# touch f
# tigger-add f
# tigger-commit -m commit-5


# # 5


# tigger-checkout b1
# tigger-merge b2 -m m2

#  5 6
# 






# echo "-------------D1_ONLY & D2_ONLY & D3_ONLY------------"
# open_tigger

# 	echo x>a
# 	tigger-add a
# 	tigger-commit -m 'commit 0'
	
# 	rm a
# 	tigger-add a
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo y>b
# 	tigger-add b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo z>c
# 	rm a
# 	tigger-add a c
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3

# 	tigger-merge b1 -m 'commit 3'
	
# 	print_all 0 1 2 3

# 



# echo "-------------file a: D1_AND_D3------------"
# open_tigger

# 	echo x>a
# 	tigger-add a
# 	tigger-commit -m 'commit 0'
	
# 	rm a
# 	tigger-add a
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo y>b
# 	tigger-add b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo z>c
	
# 	tigger-add c
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3

# 	tigger-merge b1 -m 'commit 3'
	
# 	print_all 0 1 2 3

# 



# echo "-------------file a: D2_AND_D3------------"
# open_tigger

# 	echo x>a
# 	tigger-add a
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo y>b
# 	tigger-add b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo z>c
	
# 	rm a
# 	tigger-add a c
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3
# 	tigger-merge b1 -m 'commit 3'
	
# 	print_all 0 1 2 3

# 


# echo "-------------file a: DELTA_D2_D3------------"
# open_tigger

# 	echo x>a
# 	tigger-add a
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo y>b
# 	echo xx>a
# 	tigger-add a b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo z>c
	
# 	rm a
# 	tigger-add a c
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3

# 	tigger-merge b1 -m 'commit 3'
	
# 	print_all 0 1 2 3

# 



# echo "-------------file a: DELTA_D1_D3------------"
# open_tigger

# 	echo x>a
# 	tigger-add a
# 	tigger-commit -m 'commit 0'
	
# 	rm a
# 	tigger-add a
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo y>b
# 	tigger-add b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo z>c
# 	echo xx>a
# 	tigger-add a c
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3

# 	tigger-merge b1 -m 'commit 3'
	
# 	print_all 0 1 2 3

# 



# echo "-------------file a: D1_AND_D2------------"
# open_tigger

# 	echo y>b
# 	tigger-add b
# 	tigger-commit -m 'commit 0'
	
# 	rm b
# 	tigger-add b
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo x>a
# 	tigger-add a
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo x>a
	
# 	tigger-add a
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3

# 	tigger-merge b1 -m 'commit 3'
	
# 	print_all 0 1 2 3

# 


# echo "-------------file a: DELTA_D1_D2------------"
# open_tigger

# 	echo y>b
# 	tigger-add b
# 	tigger-commit -m 'commit 0'
	
# 	rm b
# 	tigger-add b
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo x>a
# 	tigger-add a
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3

# 	tigger-merge b1 -m 'commit 3'
	
# 	print_all 0 1 2 3

# 





# echo "-------------file a: ALL_SAME------------"
# open_tigger

# 	echo x>a	
# 	echo y>b
# 	tigger-add a b
# 	tigger-commit -m 'commit 0'
	
# 	rm b
# 	tigger-add b
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo x>a
# 	echo z>c
# 	tigger-add a c
# 	tigger-commit -m 'commit 1'


	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo x>a
# 	rm b 
# 	tigger-add a b 
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3
	

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3
	
	

# 




# #D2=D1
# echo "-------------file a: DELTA_D2_D3_DELTA_D1_D3------------"
# open_tigger

# 	echo x>a	
# 	tigger-add a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a

# 	tigger-add a 
# 	tigger-commit -m 'commit 1'

# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a  
# 	tigger-commit -m 'commit 2'

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3
	

# 





# #D2=D3
# echo "-------------file a: DELTA_D1_D2_DELTA_D1_D3------------"
# open_tigger

# 	echo x>a	
# 	tigger-add a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo x>a
# 	echo y>b
# 	tigger-add a b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a 
# 	tigger-commit -m 'commit 2'

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3
	

# 





# #D1=D3
# echo "-------------file a: DELTA_D1_D2_DELTA_D2_D3------------"
# open_tigger

# 	echo x>a	
# 	tigger-add a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo x>a
# 	echo y>b
# 	tigger-add a b
# 	tigger-commit -m 'commit 2'

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3
	

# 



# echo "-------------file a: ALL_DIFFERENT------------"
# open_tigger

# 	echo x>a	
# 	tigger-add a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xxx>a
# 	tigger-add a 
# 	tigger-commit -m 'commit 2'

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3
	

# 



# echo "-------------file a: NON_FOUND------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 0'
# 	rm a
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo yy>b
	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm a
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo yyy>b
# 	tigger-add a b 
# 	tigger-commit -m 'commit 2'

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 


#  # CHECK AGAIN
# echo "-------------file a: NON_FOUND------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 0'
# 	rm a
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo yy>b
	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm a
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo yyy>b
# 	tigger-add a b 
# 	tigger-commit -m 'commit 2'
# 	print_all 0 1 2 3

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 


# #CHECK AGAIN
# echo "-------------file a: PWD_ONLY------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a b 
# 	tigger-commit -m 'commit 0'
# 	rm a
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo yy>b
	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm a
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo yy>b
	
# 	tigger-add a b 
# 	echo x>a
# 	tigger-commit -m 'commit 2'

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 


# echo "-------------file a: INDEX_ONLY------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a b 
# 	tigger-commit -m 'commit 0'
# 	rm a
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo yy>b
	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm a
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo yy>b
	
# 	tigger-add a b 
	
# 	tigger-commit -m 'commit 2'
# 	echo x>a
# 	tigger-add a
# 	rm a

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 



# echo "-------------file a: IND_AND_PWD------------"
# open_tigger
# # 
# 	echo x>a
# 	echo y>b	
# 	tigger-add  a b 
# 	tigger-commit -m 'commit 0'
# 	rm a
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo yy>b
	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm a
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo yy>b
	
# 	tigger-add a b 
	
# 	tigger-commit -m 'commit 2'
# 	echo x>a
# 	tigger-add a

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 



# echo "-------------file a: DELTA_IND_PWD------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a b 
# 	tigger-commit -m 'commit 0'
# 	rm a
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo yy>b
	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm a
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo yy>b
	
# 	tigger-add a b 
	
# 	tigger-commit -m 'commit 2'
# 	echo xx>a
# 	tigger-add a
# 	echo x>a

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 



# echo "-------------file a: REP_ONLY------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	rm b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
	
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a 
	
# 	tigger-commit -m 'commit 2'
# 	rm a 
# 	tigger-add a 
# 	echo y>b

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 




# echo "-------------file a: REP_AND_PWD------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	rm b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
	
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a 
	
# 	tigger-commit -m 'commit 2'
# 	rm a 
# 	tigger-add a 
# 	echo xx>a

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 



# echo "-------------file a: DELTA_REP_PWD------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	rm b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
	
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a 
	
# 	tigger-commit -m 'commit 2'
# 	rm a 
# 	tigger-add a 
# 	echo xxx>a

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 




# #CHECK AGAIN
# echo "-------------file a: REP_AND_IND------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a b 
# 	tigger-commit -m 'commit 0'
# 	rm b
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm b
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a b 
	
# 	tigger-commit -m 'commit 2'
	
	
# 	rm a 

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 






# echo "-------------file a: DELTA_REP_IND------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a b 
# 	tigger-commit -m 'commit 0'
# 	rm b
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm b
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo x>a
	
# 	tigger-add a b 
	
# 	tigger-commit -m 'commit 2'
# 	echo xx>a
	
# 	tigger-add a 
# 	rm a 

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 




# echo "-------------file a: ALL_SAME------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a b 
# 	tigger-commit -m 'commit 0'
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	rm b
	
# 	tigger-add b 
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
# 	rm b
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo x>a
	
# 	tigger-add a b 
	
# 	tigger-commit -m 'commit 2'
	
# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 


# # CHECK LATER
# echo "-------------file a: DELTA_IND_PWD_DELTA_REP_PWD------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	rm b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
	
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a 
	
# 	tigger-commit -m 'commit 2'
# 	echo xx>a 
# 	tigger-add a 
# 	echo xxx>a
# 	print_all 0 1 2 3
# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3






# echo "-------------file a: DELTA_REP_IND_DELTA_REP_PWD------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	rm b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
	
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a 
	
# 	tigger-commit -m 'commit 2'

# 	echo xxx>a
# 	tigger-add a 

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 




# echo "-------------file a: DELTA_REP_IND_DELTA_IND_PWD------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	rm b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
	
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a 
	
# 	tigger-commit -m 'commit 2'

# 	echo xxx>a
# 	tigger-add a 
# 	echo xx>a

# 	tigger-merge b1 -m 'commit 3'
# 	print_all 0 1 2 3

# 


# echo "-------------file a: ALL_DIFFERENT------------"
# open_tigger

# 	echo x>a
# 	echo y>b	
# 	tigger-add  a 
# 	tigger-commit -m 'commit 0'
	
	
# 	tigger-branch b1
# 	tigger-checkout b1
# 	echo xx>a
	
# 	tigger-add a b 
# 	rm b
# 	tigger-commit -m 'commit 1'
	
# 	tigger-checkout master
	
# 	tigger-branch b2
# 	tigger-checkout b2
# 	echo xx>a
	
# 	tigger-add a 
	
# 	tigger-commit -m 'commit 2'

# 	echo xxx>a
# 	tigger-add a 
# 	echo x>a

# 	tigger-merge b1 -m 'commit 3'
# 	echo "$?"
# 	print_all 0 1 2 3

# 


