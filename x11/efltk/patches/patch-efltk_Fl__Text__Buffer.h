$NetBSD$

--- efltk/Fl_Text_Buffer.h.orig	2003-06-15 20:05:55.000000000 +0000
+++ efltk/Fl_Text_Buffer.h
@@ -78,7 +78,7 @@ public:
    Fl_Text_Buffer(int requestedSize = 0);
    ~Fl_Text_Buffer();
 
-   char *Fl_Text_Buffer::static_buffer();
+   char* static_buffer();
 
     // Undo stack size: (default 50)
    int undo_size();
