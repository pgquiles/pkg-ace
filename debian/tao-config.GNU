# -*- Makefile -*-
#
# Author:  Ossama Othman <ossama@debian.org>
#
# Debian-specific helper Makefile that is invoked by the `ace-config'
# script.

include $(ACE_ROOT)/include/makeinclude/platform_macros.GNU

deb_tao_cxx:
	@echo g++

deb_tao_cppflags:
	@echo $(CPPFLAGS)

deb_tao_cxxflags:
	@echo $(CCFLAGS)

deb_tao_libs:
	@echo -lACE $(LIBS)

