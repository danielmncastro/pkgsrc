$NetBSD$

--- src/examples/ft_recv.cpp.orig	2013-04-30 21:04:50.000000000 +0000
+++ src/examples/ft_recv.cpp
@@ -15,6 +15,7 @@ using namespace gloox;
 #include <string>
 
 #include <cstdio> // [s]print[f]
+#include <ctime>
 
 #if defined( WIN32 ) || defined( _WIN32 )
 # include <windows.h>
