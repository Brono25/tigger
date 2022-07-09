#!/bin/dash
 

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'





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

# close_tigger



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

# close_tigger



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

# close_tigger


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

# close_tigger



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

# close_tigger



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

# close_tigger


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

# close_tigger





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
	
	

# close_tigger




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
	

# close_tigger





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
	

# close_tigger





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
	

# close_tigger



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
	

# close_tigger



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

# close_tigger


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

# close_tigger


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

# close_tigger


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

# close_tigger



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

# close_tigger



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

# close_tigger



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

# close_tigger




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

# close_tigger



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

# close_tigger




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

# close_tigger






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

# close_tigger




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

# close_tigger


# CHECK LATER
echo "-------------file a: DELTA_IND_PWD_DELTA_REP_PWD------------"
open_tigger

	echo x>a
	echo y>b	
	tigger-add  a 
	tigger-commit -m 'commit 0'
	
	
	tigger-branch b1
	tigger-checkout b1
	echo xx>a
	
	tigger-add a b 
	rm b
	tigger-commit -m 'commit 1'
	
	tigger-checkout master
	
	tigger-branch b2
	tigger-checkout b2
	echo xx>a
	
	tigger-add a 
	
	tigger-commit -m 'commit 2'
	echo xx>a 
	tigger-add a 
	echo xxx>a
	print_all 0 1 2 3
	tigger-merge b1 -m 'commit 3'
	print_all 0 1 2 3

close_tigger




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

# close_tigger




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

# close_tigger


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

# close_tigger


