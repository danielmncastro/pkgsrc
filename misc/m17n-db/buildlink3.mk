# $NetBSD: buildlink3.mk,v 1.1.1.1 2008/02/27 13:45:47 obache Exp $

BUILDLINK_TREE+=	m17n-db

.if !defined(M17N_DB_BUILDLINK3_MK)
M17N_DB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.m17n-db+=	m17n-db>=1.5.1
BUILDLINK_PKGSRCDIR.m17n-db?=	../../misc/m17n-db
.endif # M17N_DB_BUILDLINK3_MK

BUILDLINK_TREE+=	-m17n-db
