# $NetBSD: buildlink3.mk,v 1.11 2011/04/22 13:42:27 obache Exp $

BUILDLINK_TREE+=	xfce4-battery-plugin

.if !defined(XFCE4_BATTERY_PLUGIN_BUILDLINK3_MK)
XFCE4_BATTERY_PLUGIN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-battery-plugin+=	xfce4-battery-plugin>=0.5.0nb2
BUILDLINK_ABI_DEPENDS.xfce4-battery-plugin?=	xfce4-battery-plugin>=0.5.1nb8
BUILDLINK_PKGSRCDIR.xfce4-battery-plugin?=	../../sysutils/xfce4-battery-plugin

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.endif # XFCE4_BATTERY_PLUGIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-battery-plugin
