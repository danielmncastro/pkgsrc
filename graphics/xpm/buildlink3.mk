# $NetBSD: buildlink3.mk,v 1.15 2004/03/10 17:57:14 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
XPM_BUILDLINK3_MK:=	${XPM_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xpm
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxpm}
BUILDLINK_PACKAGES+=	xpm

.if !empty(XPM_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.xpm+=		xpm>=3.4k
BUILDLINK_RECOMMENDED.xpm?=	xpm>=3.4knb2
BUILDLINK_PKGSRCDIR.xpm?=	../../graphics/xpm

USE_X11=	yes

.endif	# XPM_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
