# -*- Makefile -*-
#
# Author:  Ossama Othman <ossama@debian.org>
#
# Debian-specific helper Makefile that is invoked by the `ace-config'
# script.

include $(ACE_ROOT)/include/makeinclude/platform_macros.GNU

deb_ace_cxx:
	@echo g++

deb_ace_cppflags:
	@echo $(CPPFLAGS)

deb_ace_cxxflags:
	@echo $(CCFLAGS)

deb_ace_libs:
	@echo -lACE $(LIBS)

