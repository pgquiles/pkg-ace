#ifndef ACE_CONFIG_H
#define ACE_CONFIG_H

// Force tools to use ACE_GPERF instead of 'gperf'
#define ACE_GPERF "gperf-ace"

// Force exception support to be enabled.
#define ACE_HAS_EXCEPTIONS 1

// Force support for timeprobes to be compiled.
#define ACE_COMPILE_TIMEPROBES 1

// Force support for POSIX Asynchronous IO (AIO) to be compiled.
#define ACE_HAS_AIO_CALLS 1

// Force %S to work in ACE_DEBUG.
#define ACE_HAS_SYS_SIGLIST 1

// bossekr@debian.org: Get the system capabilities.
#include <unistd.h>

// -------------------------------

#include "ace/config-linux.h"

#endif  /* ACE_CONFIG_H */
