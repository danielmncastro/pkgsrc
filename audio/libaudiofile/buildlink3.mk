# $NetBSD: buildlink3.mk,v 1.1 2004/01/03 23:06:43 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
AUDIOFILE_BUILDLINK3_MK:=	${AUDIOFILE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+) 
BUILDLINK_DEPENDS+=	audiofile
.endif

.if !empty(AUDIOFILE_BUILDLINK3_MK:M+) 
BUILDLINK_PACKAGES+=		audiofile
BUILDLINK_DEPENDS.audiofile?=	libaudiofile>=0.2.1
BUILDLINK_PKGSRCDIR.audiofile?=	../../audio/libaudiofile
.endif	# AUDIOFILE_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:C/\+$//}
