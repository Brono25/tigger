#!/bin/dash

trap 'rm a b' EXIT INT

./test01.sh > a 2>&1

./ref_test01.sh > b 2>&1

diff a b