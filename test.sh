#!/bin/dash




mkdir x
cd x

COMMIT_DIR="/import/cage/3/z5146619/tigger/x/a/"
INDEX="/import/cage/3/z5146619/tigger/x/b/"
PWD="/import/cage/3/z5146619/tigger/x/c/"

mkdir a 
mkdir b
mkdir c
echo x > a/"bsome file"
echo y > b/"csome other  file   "
echo x > a/"asome file again"
echo y > b/"dsome other  file another    " 
echo y > a/"dsome other  file another    " 
echo y > c/".file" 
echo y > c/"file copy" 


find "$COMMIT_DIR" "$INDEX" "$PWD" -type f  -not -path '*/.*' -exec printf '%s\n' '{}' + |xargs -I@ basename @|sort|uniq |



while IFS='' read -r line #change IFS for this loop to prevent read from tri
do
	echo "F = $line"
	

done


cd ..
rm -rd x