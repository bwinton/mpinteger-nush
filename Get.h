/**
 * Get.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Oct 09
 *
 * This file includes methods to more directly access the data in a MPInteger
 * object. The category is intended for internal use only, and as such is not
 * imported by MPInteger.h
 */

#import "Declare.h"

@interface MPInteger (Get)

/* Access a constant pointer to constant mpz_t variable. This is used to
 * pass the contents of a MPInteger object to a gmp-level function, as
 * in Arithmetic.h */
-(mpz_t const * const) contentsPointer;

@end

@interface MPMutableInteger (Get)

/* Access a writable pointer to mpz_t variable. This is used to change the
 * contents of a MPInteger object at the gmp level, as in some various
 * MPMutableInteger-specific methods. */
-(mpz_t *) mutableContentsPointer;

@end

