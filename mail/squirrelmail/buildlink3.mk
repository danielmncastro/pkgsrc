# $NetBSD: buildlink3.mk,v 1.8 2006/04/06 06:22:19 reed Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SQUIRRELMAIL_BUILDLINK3_MK:=	${SQUIRRELMAIL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	squirrelmail
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsquirrelmail}
BUILDLINK_PACKAGES+=	squirrelmail

.if !empty(SQUIRRELMAIL_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.squirrelmail+=	{ja-,}squirrelmail>=1.4.6
BUILDLINK_ABI_DEPENDS.squirrelmail?=	squirrelmail>=1.4.6
BUILDLINK_PKGSRCDIR.squirrelmail?=	../../mail/squirrelmail
.endif	# SQUIRRELMAIL_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
