#!/bin/dash
 
PATH=$PATH:/import/cage/3/z5146619/tigger


[ -d  '.tigger' ] && rm -r '.tigger'


ref_open_tigger()
{
	[ -d  'x' ] && rm -r 'x'
	mkdir x
	cd x
	2041 tigger-init 1> /dev/null
}
close_tigger()
{
	cd ..
	rm -rf x 
	echo "\n"
}

print_pwd()
{
	echo "\n	PWD:"
	for file in *
	do
		tmp=$(basename "$file")
		if [ "$tmp" = '*' ] 
		then
			echo '		-'
			continue
		fi
		echo -n "		$file -> "
		content=$(cat $file 2>/dev/null)
		echo $content
	done
}


