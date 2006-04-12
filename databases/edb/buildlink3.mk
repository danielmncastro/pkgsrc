# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:21:40 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
EDB_BUILDLINK3_MK:=	${EDB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	edb
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nedb}
BUILDLINK_PACKAGES+=	edb

.if !empty(EDB_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.edb+=	edb>=1.0.3nb3
BUILDLINK_ABI_DEPENDS.edb+=	edb>=1.0.3nb5
BUILDLINK_PKGSRCDIR.edb?=	../../databases/edb
.endif	# EDB_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
