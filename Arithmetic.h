/**
 * Arithmetic.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Oct 09
 *
 * This file includes methods to perform basic arithmetic on a MPInteger
 * object.
 */

#import "Declare.h"
#import "Get.h"
#import "Init.h"

@interface MPInteger (Arithmetic)

/* addition: These methods return a new MPInteger containing the sum of the
 * argument and the original MPInteger. */
-(id) mpIntegerByAddingMPInteger: (MPInteger *) op;
-(id) mpIntegerByAddingUnsignedInt: (unsigned long int) op;

/* subtraction: These methods return a new MPInteger containing the value of
 * the original MPInteger less the value of the argument. */
-(id) mpIntegerBySubtractingMPInteger: (MPInteger *) op;
-(id) mpIntegerBySubtractingUnsignedInt: (unsigned long int) op;

/* multiplication: These methods return a new MPInteger containing the value of
 * the original MPInteger multiplied by the value of the argument. */
-(id) mpIntegerByMultiplyingMPInteger: (MPInteger *) op;
-(id) mpIntegerByMultiplyingUnsignedInt: (unsigned long int) op;

/* negation: This method returns a MPInteger with the value of the original
 * MPInteger except its sign is inverted. */
-(id) mpIntegerByNegating;

/* absolute value: This method returns a MPInteger with the value of the
 * original MPInteger except, if the original is less than 0, the sign is
 * inverted. */
-(id) mpIntegerByAbsoluteValue;

@end

@interface MPMutableInteger (Arithmetic)

/* addition: These methods add the value of the argument to the
 * MPMutableInteger */
-(void) addMPInteger: (MPInteger *) op;
-(void) addUnsignedInt: (unsigned long int) op;

/* subtraction: These methods subtract the value of the argument from the
 * MPMutableInteger */
-(void) subtractMPInteger: (MPInteger *) op;
-(void) subtractUnsignedInt: (unsigned long int) op;

/* multiplication: These methods multiply the MPMutableInteger by the value of
 * the argument */
-(void) multiplyMPInteger: (MPInteger *) op;
-(void) multiplyUnsignedInt: (unsigned long int) op;

/* negation: This method negates the MPMutableInteger */
-(void) negate;

/* absolute value: This method inverts the sign of the MPMutableInteger if the
 * value is less than zero. */
-(void) absoluteValue;

@end

