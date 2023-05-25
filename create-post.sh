#!/bin/sh

TODAY=$(date -I)
POSTFILE=${TODAY}-${1}.md
POSTDIR=_posts
POST=${POSTDIR}/${POSTFILE}

if ! [ -n "$1" ]; then
	echo "error: filename required"
    exit 1
fi

touch ${POST}

cat > ${POST} <<- EOM
	---
	layout: post
	title: "CHANGEME"
	date: ${TODAY}
	---
EOM

echo "$POST"

${EDITOR} ${POST}
