# $NetBSD: buildlink3.mk,v 1.3 2006/04/06 06:21:50 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LDAPSDK_BUILDLINK3_MK:=	${LDAPSDK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ldapsdk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nldapsdk}
BUILDLINK_PACKAGES+=	ldapsdk

.if !empty(LDAPSDK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.ldapsdk+=	ldapsdk>=12311998
BUILDLINK_ABI_DEPENDS.ldapsdk?=	ldapsdk>=12311998nb2
BUILDLINK_PKGSRCDIR.ldapsdk?=	../../devel/ldapsdk
.endif	# LDAPSDK_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
