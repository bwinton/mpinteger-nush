/**
 * Init.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 *
 * This file includes methods to initialize a MPInteger object and allocate
 * the mpz_t variable.
 */

#import "Declare.h"
#import "Get.h"
#import "Random.h"

@interface MPInteger (Init)

/* Initialize the MPInteger with a value of 0. A MPInteger automatically
 * grows as needed. */
-(id) init;

/* Initialize with a copy of another MPInteger */
-(id) initWithMPInteger: (MPInteger *) op;

/* Initialize with the value from an unsigned int variable. */
-(id) initWithUnsignedInt: (unsigned long int) op;

/* Initialize with an integer given as a string. If no base is given, it is
 * chosen by the first characters of the string: "0x" or "0X" indicates 16,
 * "0b" or 0B" for 2, or "0" for 8. Otherwise, 10 is used. */
-(id) initWithString: (char *) str inBase: (int) base;
-(id) initWithString: (char *) str;

/* Initialize with the value from a mpz_t. Generally not useful externally, I
 * imagine, as people generally don't want to use mpz_t crap or they wouldn't
 * be using MPInteger. Used internally. */
-(id) initWithMpz: (mpz_t) op;

/* Allocate and initialize using the same cases as above. */
+(id) mpIntegerWithMPInteger: (MPInteger *) op;
+(id) mpIntegerWithUnsignedInt: (unsigned long int) op;
+(id) mpIntegerWithString: (char *) str inBase: (int) base;
+(id) mpIntegerWithString: (char *) str;
+(id) mpIntegerWithMpz: (mpz_t) op;

@end

