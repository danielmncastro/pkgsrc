# $NetBSD: buildlink.mk,v 1.3 2002/01/16 20:01:52 drochner Exp $

.include "../../lang/python/pyversion.mk"

BUILDLINK_DEPENDS.pymysqldb?= ${PYPKGPREFIX}-mysqldb-*
DEPENDS+= ${BUILDLINK_DEPENDS.pymysqldb}:../../databases/py-mysqldb
