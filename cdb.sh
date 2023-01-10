#!/usr/bin/env bash
BOOKMARK_DIR='/Users/sehun/tools/assistant/.cd_bookmarks'
USAGE='Usage: cdb [-c|-g|-d|-l] [bookmark]
-c: create bookmark
-g: goto bookmark
-d: delete bookmark
-l: list bookmarks'

function cdb() {

	if  [ ! -e ${BOOKMARK_DIR} ] ; then
		mkdir ${BOOKMARK_DIR}
	fi

	case $1 in
		# create bookmark
		-c) shift
		if [ ! -f ${BOOKMARK_DIR}/$1 ] ; then
			echo "cd `pwd`" > ${BOOKMARK_DIR}/"$1" ;
		else
			echo "Try again! Looks like there is already a bookmark '$1'"
		fi
		;;
		# goto bookmark
		-g) shift
		if [ -f ${BOOKMARK_DIR}/$1 ] ; then
			source ${BOOKMARK_DIR}/"$1"
		else
			echo "Looks like your bookmark does not exist." ;
		fi
		;;
		# delete bookmark
		-d) shift
		if [ -f ${BOOKMARK_DIR}/$1 ] ; then
			rm ${BOOKMARK_DIR}/"$1" ;
		else
			echo "Oops, forgot to specify the bookmark" ;
		fi    
		;;
		# list bookmarks
		-l) shift
		cd ${BOOKMARK_DIR}/ ;
		for file in $(ls)
		do
			echo "${file}: $(cat ${file})"
		done
		;;
	  *) echo "$USAGE" ;
		;;
esac
}
