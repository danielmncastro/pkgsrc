$NetBSD$

--- lib/libnative/java.lang/system.c.orig	2013-02-25 20:27:29.000000000 +0000
+++ lib/libnative/java.lang/system.c
@@ -260,7 +260,7 @@ Java_java_lang_System_identityHashCode(J
   if (obj == NULL)
     {
       throw_Exception(env, "java/lang/NullPointerException", NULL);
-      return;
+      return -1;
     }
 
   obj_to_object(obj, jobj);
