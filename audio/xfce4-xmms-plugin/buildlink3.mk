# $NetBSD$

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
XFCE4_XMMS_PLUGIN_BUILDLINK3_MK:=	${XFCE4_XMMS_PLUGIN_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xfce4-xmms-plugin
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-xmms-plugin}
BUILDLINK_PACKAGES+=	xfce4-xmms-plugin

.if !empty(XFCE4_XMMS_PLUGIN_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.xfce4-xmms-plugin+=	xfce4-xmms-plugin>=0.1.1nb4
BUILDLINK_PKGSRCDIR.xfce4-xmms-plugin?=	../../audio/xfce4-xmms-plugin

.include "../../audio/xmms/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

.endif	# XFCE4_XMMS_PLUGIN_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
