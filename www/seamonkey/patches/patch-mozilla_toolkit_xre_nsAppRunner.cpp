$NetBSD$

--- mozilla/toolkit/xre/nsAppRunner.cpp.orig	2013-01-06 06:26:32.000000000 +0000
+++ mozilla/toolkit/xre/nsAppRunner.cpp
@@ -3826,7 +3826,7 @@ XREMain::XRE_main(int argc, char* argv[]
   ScopedLogging log;
 
 #if defined(MOZ_WIDGET_GTK)
-#ifdef MOZ_MEMORY
+#if defined(MOZ_MEMORY) || defined(__FreeBSD__) || defined(__NetBSD__)
   // Disable the slice allocator, since jemalloc already uses similar layout
   // algorithms, and using a sub-allocator tends to increase fragmentation.
   // This must be done before g_thread_init() is called.
