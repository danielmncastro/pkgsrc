# $NetBSD: buildlink3.mk,v 1.12 2006/04/06 06:22:46 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
XFCE4_SYSTRAY_BUILDLINK3_MK:=	${XFCE4_SYSTRAY_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xfce4-systray
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-systray}
BUILDLINK_PACKAGES+=	xfce4-systray

.if !empty(XFCE4_SYSTRAY_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.xfce4-systray+=	xfce4-systray>=4.2.3
BUILDLINK_ABI_DEPENDS.xfce4-systray?=	xfce4-systray>=4.2.3nb2
BUILDLINK_PKGSRCDIR.xfce4-systray?=	../../sysutils/xfce4-systray
.endif	# XFCE4_SYSTRAY_BUILDLINK3_MK

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
