# $OpenBSD$

COMMENT=	Automatic WiFi configuration daemon

V = 0.4
DISTNAME= ifscand-${V}
CATEGORIES=	net

MAINTAINER= Sudhi Herle <sudhi+openbsd@herle.net>

HOMEPAGE=	https://github.com/opencoff/ifscand

# source is here
GH_ACCOUNT= opencoff
GH_PROJECT= ifscand
GH_COMMIT= 15ebc71ce42db52279051e2737a6ce055dfbf2bd

PERMIT_PACKAGE_CDROM=	Yes
NO_TEST = Yes


WANTLIB += c util

post-install:
	mkdir -p ${PREFIX}/etc/rc.d
	cp ${WRKDIST}/etc/rc.d/ifscand ${PREFIX}/etc/rc.d/
	cat ${WRKDIST}/etc/rc.conf.local >> ${PREFIX}/etc/rc.conf.local
	@cat ${WRKDIST}/etc/post-install.txt

.include <bsd.port.mk>

