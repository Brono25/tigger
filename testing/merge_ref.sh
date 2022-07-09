#!/bin/dash
 

. ./test_functions.sh

trap 'rm -f a b' EXIT INT

[ -d  '.tigger' ] && rm -r '.tigger'




# #can merge
# echo "-------------D1_ONLY & D2_ONLY & D3_ONLY------------"
# ref_open_tigger

# 	echo x>a
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 0'
	
# 	rm a
# 	2041 tigger-add a
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo y>b
# 	2041 tigger-add b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo z>c
# 	rm a
# 	2041 tigger-add a c
# 	2041 tigger-commit -m 'commit 2'

# 	ref_print_all 0 1 2 3

# 	2041 tigger-merge b1 -m 'commit 3'
	
# 	ref_print_all 0 1 2 3

# close_tigger



# echo "-------------file a: D1_AND_D3------------"
# ref_open_tigger

# 	echo x>a
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 0'
	
# 	rm a
# 	2041 tigger-add a
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo y>b
# 	2041 tigger-add b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo z>c
	
# 	2041 tigger-add c
# 	2041 tigger-commit -m 'commit 2'
# 	ref_print_all 0 1 2 3

# 	2041 tigger-merge b1 -m 'commit 3'
	
# 	ref_print_all 0 1 2 3

# close_tigger



# echo "-------------file a: D2_AND_D3------------"
# ref_open_tigger

# 	echo x>a
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo y>b
# 	2041 tigger-add b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo z>c
	
# 	rm a
# 	2041 tigger-add a c
# 	2041 tigger-commit -m 'commit 2'
# 	ref_print_all 0 1 2 3
# 	2041 tigger-merge b1 -m 'commit 3'
	
# 	ref_print_all 0 1 2 3

# close_tigger



# echo "-------------file a: DELTA_D2_D3------------"
# ref_open_tigger

# 	echo x>a
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo y>b
# 	echo xx>a
# 	2041 tigger-add a b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo z>c
	
# 	rm a
# 	2041 tigger-add a c
# 	2041 tigger-commit -m 'commit 2'
# 	ref_print_all 0 1 2 3

# 	2041 tigger-merge b1 -m 'commit 3'
	
# 	ref_print_all 0 1 2 3

# close_tigger



# echo "-------------file a: DELTA_D1_D3------------"
# ref_open_tigger

# 	echo x>a
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 0'
	
# 	rm a
# 	2041 tigger-add a
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo y>b
# 	2041 tigger-add b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo z>c
# 	echo xx>a
# 	2041 tigger-add a c
# 	2041 tigger-commit -m 'commit 2'
# 	ref_print_all 0 1 2 3

# 	2041 tigger-merge b1 -m 'commit 3'
	
# 	ref_print_all 0 1 2 3

# close_tigger




# echo "-------------file a: D1_AND_D2------------"
# ref_open_tigger

# 	echo y>b
# 	2041 tigger-add b
# 	2041 tigger-commit -m 'commit 0'
	
# 	rm b
# 	2041 tigger-add b
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo x>a
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo x>a
	
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 2'
# 	ref_print_all 0 1 2 3

# 	2041 tigger-merge b1 -m 'commit 3'
	
# 	ref_print_all 0 1 2 3

# close_tigger



# echo "-------------file a: DELTA_D1_D2------------"
# ref_open_tigger

# 	echo y>b
# 	2041 tigger-add b
# 	2041 tigger-commit -m 'commit 0'
	
# 	rm b
# 	2041 tigger-add b
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo x>a
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a
# 	2041 tigger-commit -m 'commit 2'
# 	ref_print_all 0 1 2 3

# 	2041 tigger-merge b1 -m 'commit 3'
	
# 	ref_print_all 0 1 2 3

# close_tigger



# echo "-------------file a: ALL_SAME------------" #interest
# ref_open_tigger

# 	echo x>a	
# 	echo y>b
# 	2041 tigger-add a b
# 	2041 tigger-commit -m 'commit 0'

# 	rm b
# 	2041 tigger-add b
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo x>a
# 	echo z>c
# 	2041 tigger-add a c
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo x>a
# 	rm b 
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 2'
# 	ref_print_all 0 1 2 3	

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3	
	

# close_tigger



# #D2=D1
# echo "-------------file a: DELTA_D2_D3_DELTA_D1_D3------------"
# ref_open_tigger

# 	echo x>a	
# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a

# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 1'

# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a  
# 	2041 tigger-commit -m 'commit 2'

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3
	

# close_tigger




# #D2=D3
# echo "-------------file a: DELTA_D1_D2_DELTA_D1_D3------------"
# ref_open_tigger

# 	echo x>a	
# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo x>a
# 	echo y>b
# 	2041 tigger-add a b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 2'

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3
	

# close_tigger



# #D1=D3
# echo "-------------file a: DELTA_D1_D2_DELTA_D2_D3------------"
# ref_open_tigger

# 	echo x>a	
# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo x>a
# 	echo y>b
# 	2041 tigger-add a b
# 	2041 tigger-commit -m 'commit 2'

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3
	

# close_tigger


# echo "-------------file a: ALL_DIFFERENT------------"
# ref_open_tigger

# 	echo x>a	
# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 0'
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xxx>a
# 	2041 tigger-add a 
# 	2041 tigger-commit -m 'commit 2'

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3
	

# close_tigger


# # CHECK AGAIN
# echo "-------------file a: NON_FOUND------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 0'
# 	rm a
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo yy>b
	
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	rm a
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo yyy>b
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 2'
# 	ref_print_all 0 1 2 3

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger


# # CHECK AGAIN
# echo "-------------file a: PWD_ONLY------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a b 
# 	2041 tigger-commit -m 'commit 0'
# 	rm a
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo yy>b
	
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	rm a
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo yy>b
	
# 	2041 tigger-add a b 
# 	echo x>a
# 	2041 tigger-commit -m 'commit 2'

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger


# #error: local changes
# echo "-------------file a: INDEX_ONLY------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a b 
# 	2041 tigger-commit -m 'commit 0'
# 	rm a
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo yy>b
	
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	rm a
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo yy>b
	
# 	2041 tigger-add a b 
	
# 	2041 tigger-commit -m 'commit 2'
# 	echo x>a
# 	2041 tigger-add a
# 	rm a

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger





# echo "-------------file a: IND_AND_PWD------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a b 
# 	2041 tigger-commit -m 'commit 0'
# 	rm a
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo yy>b
	
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	rm a
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo yy>b
	
# 	2041 tigger-add a b 
	
# 	2041 tigger-commit -m 'commit 2'
# 	echo x>a
# 	2041 tigger-add a

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger




# echo "-------------file a: DELTA_IND_PWD------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a b 
# 	2041 tigger-commit -m 'commit 0'
# 	rm a
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo yy>b
	
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	rm a
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo yy>b
	
# 	2041 tigger-add a b 
	
# 	2041 tigger-commit -m 'commit 2'
# 	echo xx>a
# 	2041 tigger-add a
# 	echo x>a

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger




# echo "-------------file a: REP_ONLY------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a b 
# 	rm b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
	
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a 
	
# 	2041 tigger-commit -m 'commit 2'
# 	rm a 
# 	2041 tigger-add a 
# 	echo y>b

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger



# echo "-------------file a: REP_AND_PWD------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a b 
# 	rm b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
	
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a 
	
# 	2041 tigger-commit -m 'commit 2'
# 	rm a 
# 	2041 tigger-add a 
# 	echo xx>a

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger





# echo "-------------file a: DELTA_REP_PWD------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a b 
# 	rm b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
	
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a 
	
# 	2041 tigger-commit -m 'commit 2'
# 	rm a 
# 	2041 tigger-add a 
# 	echo xxx>a

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger


# #CHECK AGAIN
# echo "-------------file a: REP_AND_IND------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a b 
# 	2041 tigger-commit -m 'commit 0'
# 	rm b
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	rm b
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a b 
	
# 	2041 tigger-commit -m 'commit 2'
	
	
# 	rm a 

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger




# echo "-------------file a: DELTA_REP_IND------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a b 
# 	2041 tigger-commit -m 'commit 0'
# 	rm b
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a b 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	rm b
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo x>a
	
# 	2041 tigger-add a b 
	
# 	2041 tigger-commit -m 'commit 2'
# 	echo xx>a
	
# 	2041 tigger-add a 
# 	rm a 

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger



# echo "-------------file a: ALL_SAME------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a b 
# 	2041 tigger-commit -m 'commit 0'
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	rm b
	
# 	2041 tigger-add b 
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
# 	rm b
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo x>a
	
# 	2041 tigger-add a b 
	
# 	2041 tigger-commit -m 'commit 2'
	
# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger


# CHECK LATER
echo "-------------file a: DELTA_IND_PWD_DELTA_REP_PWD------------"
ref_open_tigger

	echo x>a
	echo y>b	
	2041 tigger-add  a 
	2041 tigger-commit -m 'commit 0'
	
	
	2041 tigger-branch b1
	2041 tigger-checkout b1
	echo xx>a
	
	2041 tigger-add a b 
	rm b
	2041 tigger-commit -m 'commit 1'
	
	2041 tigger-checkout master
	
	2041 tigger-branch b2
	2041 tigger-checkout b2
	echo xx>a
	
	2041 tigger-add a 
	
	2041 tigger-commit -m 'commit 2'
	echo xx>a 
	2041 tigger-add a 
	echo xxx>a
	ref_print_all 0 1 2 3

	2041 tigger-merge b1 -m 'commit 3'
	ref_print_all 0 1 2 3

close_tigger





# echo "-------------file a: DELTA_REP_IND_DELTA_REP_PWD------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a b 
# 	rm b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
	
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a 
	
# 	2041 tigger-commit -m 'commit 2'

# 	echo xxx>a
# 	2041 tigger-add a 

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger





# echo "-------------file a: DELTA_REP_IND_DELTA_IND_PWD------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a b 
# 	rm b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
	
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a 
	
# 	2041 tigger-commit -m 'commit 2'

# 	echo xxx>a
# 	2041 tigger-add a 
# 	echo xx>a

# 	2041 tigger-merge b1 -m 'commit 3'
# 	ref_print_all 0 1 2 3

# close_tigger





# echo "-------------file a: ALL_DIFFERENT------------"
# ref_open_tigger

# 	echo x>a
# 	echo y>b	
# 	2041 tigger-add  a 
# 	2041 tigger-commit -m 'commit 0'
	
	
# 	2041 tigger-branch b1
# 	2041 tigger-checkout b1
# 	echo xx>a
	
# 	2041 tigger-add a b 
# 	rm b
# 	2041 tigger-commit -m 'commit 1'
	
# 	2041 tigger-checkout master
	
# 	2041 tigger-branch b2
# 	2041 tigger-checkout b2
# 	echo xx>a
	
# 	2041 tigger-add a 
	
# 	2041 tigger-commit -m 'commit 2'

# 	echo xxx>a
# 	2041 tigger-add a 
# 	echo x>a

# 	2041 tigger-merge b1 -m 'commit 3'
# 	echo "$?"
# 	ref_print_all 0 1 2 3

# close_tigger






