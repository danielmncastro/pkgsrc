# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:22:56 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
XMHTML_BUILDLINK3_MK:=	${XMHTML_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	XmHTML
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NXmHTML}
BUILDLINK_PACKAGES+=	XmHTML

.if !empty(XMHTML_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.XmHTML+=	XmHTML>=1.1.7nb2
BUILDLINK_ABI_DEPENDS.XmHTML+=	XmHTML>=1.1.7nb5
BUILDLINK_PKGSRCDIR.XmHTML?=	../../x11/XmHTML
.endif	# XMHTML_BUILDLINK3_MK

.include "../../graphics/jpeg/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/xpm/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
