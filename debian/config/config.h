#ifndef ACE_CONFIG_H
#define ACE_CONFIG_H

// bossekr@debian.org: Get the system capabilities.
#include <unistd.h>

// Always inline
#define __ACE_INLINE__

/* Platform supports IPv6 */
#define ACE_HAS_IPV6 1

// -------------------------------

#ifdef __FreeBSD_kernel__
#include "ace/config-kfreebsd.h"
#else
#include "ace/config-linux.h"
#endif

#endif  /* ACE_CONFIG_H */
