$NetBSD$

--- mozilla/toolkit/components/osfile/osfileutils.cpp.orig	2013-01-06 06:26:31.000000000 +0000
+++ mozilla/toolkit/components/osfile/osfileutils.cpp
@@ -7,6 +7,10 @@
 #include "nsCOMPtr.h"
 #include "nsCRTGlue.h"
 
+#if defined (__DragonFly__)
+#include <sys/param.h>
+#endif
+
 // Utilities for handling errors
 namespace {
 
@@ -48,7 +52,9 @@ void error_no_memory() {
  * the last operation failed because it is not supported.
  */
 void error_not_supported() {
+#if !(defined(__DragonFly_version) && (__DragonFly_version < 300301))
   errno = ENOTSUP;
+#endif
 }
 
 /**
@@ -57,7 +63,9 @@ void error_not_supported() {
  * argument.
  */
 void error_invalid_argument() {
+#if !(defined(__DragonFly_version) && (__DragonFly_version < 300301))
   errno = EINVAL;
+#endif
 }
 
 /**
@@ -66,7 +74,9 @@ void error_invalid_argument() {
  * memory.
  */
 void error_no_memory() {
+#if !(defined(__DragonFly_version) && (__DragonFly_version < 300301))
   errno = ENOMEM;
+#endif
 }
 
 #endif // defined(XP_WIN)
