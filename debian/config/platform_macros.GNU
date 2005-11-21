# -*- Makefile -*-


# Enable ACE_Timeprobe support.
probe=1

# Enable support for the ACE_XT_Reactor.
xt_reactor=1

# Enable native C++ exception support.
exceptions=1

# Enable thread support.
threads=1

# Enable optimizations.
optimize=1

# Disable debugging symbol generation and configure for a "release"
# build.
debug=0

# Enable ssl support
ssl=1

# Enable security
security=1

# Enable RT CORBA
rtcorba=1

# Enable CORBA messaging
corba_messaging=1

include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU

