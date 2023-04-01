#!/usr/bin/env bash
function cdb() {
	local bookmark_db='/Users/sehun/tools/cdb/.cd_bookmarks'
	local tmp_file='/tmp/tmpfile'
	local usage='Usage: cdb [-c|-g|-d|-l] [bookmark]
	-c: create bookmark
	-g: goto bookmark
	-d: delete bookmark
	-l: list bookmarks'


	if  [ ! -e ${bookmark_db} ] ; then
		touch ${bookmark_db}
	fi
	# echo ":$(grep $1 ${bookmark_db}):"

	case $1 in
		# create bookmark
		-c) shift
		if [ -z $(grep "^${1}:" ${bookmark_db}) ] ; then
			echo "${1}:$(pwd)" >> ${bookmark_db} ;
		else
			echo "Try again! Looks like there is already a bookmark '$1'"
		fi
		;;
		# delete bookmark
		-d) shift
		if [ -n $(grep "^${1}:" ${bookmark_db}) ] ; then
			grep -v "^${1}:" ${bookmark_db} > ${tmp_file}
			cat ${tmp_file} > ${bookmark_db} ;
		else
			echo "Oops, forgot to specify the bookmark" ;
		fi    
		;;
		# list bookmarks
		-l) shift
		cat ${bookmark_db}
		;;
		# help
		-h) shift
		echo "$usage" ;
		;;
		# goto bookmark
		*)
		if [ -n $1 ] ; then
			echo $(grep "^${1}:" ${bookmark_db} | sed "s/^${1}://") > ${tmp_file}
			cd $(cat ${tmp_file}) ;
		else
			echo "Looks like your bookmark does not exist." ;
		fi
		;;
esac
}
