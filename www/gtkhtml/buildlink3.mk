# $NetBSD: buildlink3.mk,v 1.2 2004/10/03 00:18:26 tv Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GTKHTML_BUILDLINK3_MK:=	${GTKHTML_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gtkhtml
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngtkhtml}
BUILDLINK_PACKAGES+=	gtkhtml

.if !empty(GTKHTML_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.gtkhtml?=	gtkhtml>=1.1.10nb5
BUILDLINK_PKGSRCDIR.gtkhtml?=	../../www/gtkhtml
.endif	# GTKHTML_BUILDLINK3_MK

.include "../../devel/bonobo/buildlink3.mk"
.include "../../devel/gal/buildlink3.mk"
.include "../../print/gnome-print/buildlink3.mk"
.include "../../www/glibwww/buildlink3.mk"
.include "../../www/libghttp/buildlink3.mk"
.include "../../x11/controlcenter/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
