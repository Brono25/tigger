#!/bin/dash

#trap 'rm ax bx' EXIT INT

./test01.sh > ax 2>&1

./ref_test01.sh > bx 2>&1

diff ax bx

rm ax bx

./test02.sh > ax 2>&1

./ref_test02.sh > bx 2>&1

diff ax bx

rm ax bx