$NetBSD$

* Do not include sys/sysctl.h.
  Probably it is detected mistakably.

--- libiberty/physmem.c.orig	2003-06-09 05:20:02.000000000 +0000
+++ libiberty/physmem.c
@@ -48,7 +48,7 @@
 # include <sys/param.h>
 #endif
 
-#if HAVE_SYS_SYSCTL_H
+#if 0
 # include <sys/sysctl.h>
 #endif
 
