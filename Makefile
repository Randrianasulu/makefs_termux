#	$NetBSD: Makefile,v 1.36 2013/08/05 14:41:57 reinoud Exp $
#

WARNS?=	5

# .include <bsd.own.mk>

PROG=	makefs
SRCS=	udf.c strstuff.c \
	makefs.c \
	walk.c
MAN=	makefs.8

MKNODSRC=	${NETBSDSRCDIR}/sbin/mknod
MTREESRC=	${NETBSDSRCDIR}/usr.sbin/mtree

CPPFLAGS+=	-I${.CURDIR} -I${MKNODSRC} -I${MTREESRC} -DMAKEFS
#CPPFLAGS+=	-DMSDOSFS_DEBUG
#PATH:		${MKNODSRC} ${MTREESRC}

#.include "${.CURDIR}/cd9660/Makefile.inc"
#.include "${.CURDIR}/chfs/Makefile.inc"
#.include "${.CURDIR}/ffs/Makefile.inc"
#.include "${.CURDIR}/v7fs/Makefile.inc"
#.include "${.CURDIR}/msdos/Makefile.inc"

SRCS+= udf/udf_write.c udf/udf_osta.c udf/udf_create.c

#if !defined(HOSTPROG)
DPADD+= ${LIBUTIL}
LDADD+= -lutil
#endif

prog:
	${CC} -o $(PROG) $(SRCS) -I./udf

#.include <bsd.prog.mk>
# DO NOT DELETE
