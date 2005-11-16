#ifndef ACE_CONFIG_H
#define ACE_CONFIG_H

// Force exception support to be enabled.
#define ACE_HAS_EXCEPTIONS 1

// No need for the ACE_ASSERTions and RCSIDs since this is a "release"
// (i.e. non-debug) build.
#define ACE_NDEBUG 1
#define ACE_USE_RCSID 0

// Force support for timeprobes to be compiled.
#define ACE_COMPILE_TIMEPROBES 1

// Force support for POSIX Asynchronous IO (AIO) to be compiled.
#define ACE_HAS_AIO_CALLS 1

// BN: hmm, not sure if these are needed?
#ifndef POSIX_THREADS
#  define POSIX_THREADS
#endif
#ifndef _POSIX_THREAD_SAFE_FUNCTIONS
#  define _POSIX_THREAD_SAFE_FUNCTIONS
#endif
#ifndef  _REENTRANT
#  define _REENTRANT
#endif

// -------------------------------

#include "ace/config-linux.h"

#endif  /* ACE_CONFIG_H */
