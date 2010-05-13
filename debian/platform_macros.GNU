exceptions     = 1
debug          = 0
optimize       = 1
inline         = 1

ssl            = 1

xt             = 1
tk             = 1
fl             = 1
fox            = 1
qt4            = 1
ace_qt4reactor = 1

include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU

PLATFORM_FOX_CPPFLAGS=-I/usr/include/fox-1.6
PLATFORM_FOX_LIBS=-lFOX-1.6
