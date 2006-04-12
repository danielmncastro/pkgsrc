# $NetBSD: buildlink3.mk,v 1.4 2006/04/06 06:22:20 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FFTW2_BUILDLINK3_MK:=	${FFTW2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	fftw2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfftw2}
BUILDLINK_PACKAGES+=	fftw2

.if !empty(FFTW2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.fftw2+=	fftw2>=2.1.3
BUILDLINK_ABI_DEPENDS.fftw2?=	fftw2>=2.1.5nb2
BUILDLINK_PKGSRCDIR.fftw2?=	../../math/fftw2
.endif	# FFTW2_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
