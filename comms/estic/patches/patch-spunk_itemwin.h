$NetBSD$

--- spunk/itemwin.h.orig	1996-11-07 18:06:48.000000000 +0000
+++ spunk/itemwin.h
@@ -55,6 +55,8 @@ const u16 ifNoSub               = 0x0010
 /*****************************************************************************/
 
 
+class ResEditApp;
+class ItemWindow;
 
 class WindowItem : public Streamable {
 
