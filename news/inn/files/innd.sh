#!/bin/sh
#
# $NetBSD: innd.sh,v 1.1 1999/07/21 20:38:56 tron Exp $
#
if [ -x @@PREFIX@@/bin/rc.news -a -s @@INN_DATA_DIR@@/db/active ];
then
 @@PREFIX@@/bin/rc.news >/dev/null
 echo -n ' innd'
fi
exit 0
