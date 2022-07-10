#!/bin/dash
 
PATH=$PATH:/import/cage/3/z5146619/tigger


[ -d  '.tigger' ] && rm -r '.tigger'


open_tigger()
{
	[ -d  'x' ] && rm -r 'x'
	mkdir x
	cd x
	tigger-init 1> /dev/null
}

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
			echo '		$file-'
			continue
		fi
		echo -n "		$file -> "
		content=$(cat $file 2>/dev/null)
		echo $content
	done
}


ref_print_ind()
{
	echo "\n	IND:"
	for file in $@
	do
		2041 tigger-show :$file   1> /dev/null 2> /dev/null|| continue
		
		echo "		$file -> $(2041 tigger-show :$file)"

	done
	
}

ref_print_repo()
{
	repo="$1"
	shift 1

	echo "\n	REP:$repo"
	for file in $@
	do
		2041 tigger-show "$repo:$file"   1> /dev/null 2> /dev/null|| continue
		echo "		$file -> $(2041 tigger-show $repo:$file)"
		
	done

}



ref_print_all()
{
	repo=$1
	echo '\n'
	print_pwd
	ref_print_ind a b c d e f g h i j k

	for rep in $@
	do
		ref_print_repo "$rep" a b c d e f g h i j k
	done
	echo '\n'
	2041 tigger-status
	echo '\n'
}


print_ind()
{
	echo "\n	IND:"
	for file in $@
	do
		tigger-show :$file   1> /dev/null 2> /dev/null|| continue
		
		echo "		$file -> $(tigger-show :$file)"

	done
	
}

print_repo()
{
	repo="$1"
	shift 1

	echo "\n	REP:$repo"
	for file in $@
	do
		tigger-show "$repo:$file"   1> /dev/null 2> /dev/null|| continue
		echo "		$file -> $(tigger-show $repo:$file)"
		
	done

}



print_all()
{
	repo=$1
	echo '\n'
	print_pwd
	print_ind a b c d e f g h i j k

	for rep in $@
	do
		print_repo "$rep" a b c d e f g h i j k 
	done
	echo '\n'
	tigger-status
	echo '\n'
}


