/**
 * Convert.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 22
 *
 * This file includes methods to convert the value stored in a MPInteger to
 * some other data type.
 */

#import "Declare.h"
#import "Get.h"
#import "Init.h"

@interface MPInteger (Convert)

/* int value: This method returns a signed (actually long) int with the same
 * value as the MPInteger. If the value will not fit into a signed int,
 * something mostly pointless is returned. If you want to know if it can fit,
 * hold tight. Someday soon the Fits category will (hopefully) be coming,
 * unveiling such functions as -(BOOL) fitsInInt: etc. */
-(signed long int) intValue;

/* unsigned int value: This method returns an unsigned long int with the same
 * value as the (absolute value of the) MPInteger. If the value will not fit,
 * only the least significant digits are returned. */
-(unsigned long int) unsignedIntValue;

/* double value: This method attempts to convert the MPInteger to a double and
 * return that double. The value is truncated if necessary. If the value can't
 * fit, something crazy may happen. */
-(double) doubleValue;

/* string value: These methods return the value of the MPInteger as a character
 * array (c style string). If no base is given, 10 is assumed. Useful for
 * printing large MPIntegers until the Display category is done. */
-(NSString *) stringValue;
-(NSString *) stringValueInBase: (int) base;

@end

@interface MPMutableInteger (Convert)

-(void) makeImmutable;

@end

