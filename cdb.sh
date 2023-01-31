#!/usr/bin/env bash
function cdb() {
	local bookmark_dir='/Users/sehun/tools/assistant/.cd_bookmarks'
	local usage='Usage: cdb [-c|-g|-d|-l] [bookmark]
	-c: create bookmark
	-g: goto bookmark
	-d: delete bookmark
	-l: list bookmarks'


	if  [ ! -e ${bookmark_dir} ] ; then
		mkdir ${bookmark_dir}
	fi

	case $1 in
		# create bookmark
		-c) shift
		if [ ! -f ${bookmark_dir}/$1 ] ; then
			echo "cd `pwd`" > ${bookmark_dir}/"$1" ;
		else
			echo "Try again! Looks like there is already a bookmark '$1'"
		fi
		;;
		# delete bookmark
		-d) shift
		if [ -f ${bookmark_dir}/$1 ] ; then
			rm ${bookmark_dir}/"$1" ;
		else
			echo "Oops, forgot to specify the bookmark" ;
		fi    
		;;
		# list bookmarks
		-l) shift
		cd ${bookmark_dir}/ ;
		for file in $(ls)
		do
			echo "${file}: $(cat ${file})"
		done
		;;
		# help
		-h) shift
		echo "$usage" ;
		;;
		# goto bookmark
		*)
		if [ -f ${bookmark_dir}/$1 ] ; then
			source ${bookmark_dir}/"$1"
		else
			echo "Looks like your bookmark does not exist." ;
		fi
		;;
esac
}
