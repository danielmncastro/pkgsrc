# $NetBSD: buildlink3.mk,v 1.2 2006/04/06 06:21:43 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
TINYCDB_BUILDLINK3_MK:=	${TINYCDB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	tinycdb
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ntinycdb}
BUILDLINK_PACKAGES+=	tinycdb

.if !empty(TINYCDB_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.tinycdb+=	tinycdb>=0.75
BUILDLINK_DEPMETHOD.tinycdb?=	build
BUILDLINK_PKGSRCDIR.tinycdb?=	../../databases/tinycdb
.endif	# TINYCDB_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
