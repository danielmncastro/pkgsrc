# $NetBSD: Makefile,v 1.3 2012/10/03 21:58:20 wiz Exp $

DISTNAME=	DateTime-Format-Oracle-0.05
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	time perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=DateTime/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/DateTime-Format-Oracle/
COMMENT=	Parse and format Oracle dates and timestamps
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Convert-NLS_DATE_FORMAT-[0-9]*:../../time/p5-Convert-NLS_DATE_FORMAT
DEPENDS+=	p5-DateTime-[0-9]*:../../time/p5-DateTime
DEPENDS+=	p5-DateTime-Format-Builder-[0-9]*:../../time/p5-DateTime-Format-Builder

PERL5_PACKLIST=		auto/DateTime/Format/Oracle/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
