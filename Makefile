# $OpenBSD$

COMMENT=	Automatic WiFi configuration daemon

V = 0.5
DISTNAME= ifscand-${V}
CATEGORIES=	net

MAINTAINER= Sudhi Herle <sudhi+openbsd@herle.net>

HOMEPAGE=	https://github.com/opencoff/ifscand

# source is here
GH_ACCOUNT= opencoff
GH_PROJECT= ifscand
GH_COMMIT= e163d1f318ca9b0b22ac67486ef12ac2a273f8c5

PERMIT_PACKAGE_CDROM=	Yes
NO_TEST = Yes


WANTLIB += c util

post-install:
	mkdir -p ${PREFIX}/etc/rc.d
	cp ${WRKDIST}/etc/rc.d/ifscand ${PREFIX}/etc/rc.d/
	cat ${WRKDIST}/etc/rc.conf.local >> ${PREFIX}/etc/rc.conf.local
	@cat ${WRKDIST}/etc/post-install.txt

.include <bsd.port.mk>

