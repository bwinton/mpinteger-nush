/**
 * Set.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Oct 09
 *
 * This file includes methods to set a MPMutableInteger object using data from
 * another MPInteger object or another variable.
 */

#import "Declare.h"
#import "Get.h"

@interface MPMutableInteger (Set)

/* Set to the value of an existing MPInteger object */
-(void) setWithMPInteger: (MPInteger *) op;

/* Set to the value of an unsigned int */
-(void) setWithUnsignedInt: (unsigned long int) op;

/* setting with string: if no base is given, it is chosen by the first
 * characters of the string: "0x" or "0X" indicates 16, "0b" or 0B" for 2,
 * or "0" for 8. Otherwise, 10 is used. */
-(void) setWithString: (NSString *) str;
-(void) setWithString: (NSString *) str inBase: (int) base;

@end

