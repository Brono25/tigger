#!/bin/dash

#trap 'rm ax bx' EXIT INT

# ./test01.sh > ax 2>&1
# ./ref_test01.sh > bx 2>&1
# diff ax bx
# rm ax bx




# ./test02.sh > ax 2>&1
# ./ref_test02.sh > bx 2>&1
# diff ax bx
# rm ax bx





# ./test04.sh > ax 2>&1
# ./ref_test04.sh > bx 2>&1
# diff ax bx
# rm ax bx





# ./test05.sh > ax 2>&1
# ./ref_test05.sh > bx 2>&1
# diff ax bx
# rm ax bx



# ./rm_test.sh > ax 2>&1
# ./ref_rm_test.sh > bx 2>&1
# diff ax bx
# rm ax bx


./commit_test.sh &> bb;./ref_commit_test.sh &> aa;diff aa bb;rm aa bb


./rm_test.sh &> bb;./ref_rm_test.sh &> aa;diff aa bb;rm aa bb


./branch_test.sh &>aa ; ./ref_branch_test.sh &>bb; diff aa bb ;rm aa bb

./add_test.sh &>aa ; ./ref_add_test.sh &>bb; diff aa bb ;rm aa bb


./checkout_test.sh &>aa ; ./ref_checkout_test.sh &>bb; diff aa bb ;rm aa bb