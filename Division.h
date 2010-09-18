/**
 * Division.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Oct 09
 *
 * This file includes methods to perform various division operations on a
 * MPInteger object.
 */

#import "Declare.h"
#import "Get.h"
#import "Init.h"

@interface MPInteger (Division)

/* inexact division: These methods return a new MPInteger containing the value
 * of the original MPInteger divided by the value of the argument. The quotient
 * is truncated. */
-(id) mpIntegerByDividingMPInteger: (MPInteger *) op;
-(id) mpIntegerByDividingUnsignedInt: (unsigned long int) op;

/* exact division: These methods return a new MPInteger containing the exact
 * divison of the original MPInteger by the value of the argument. The division
 * is much faster, but only guaranteed to be correct if it divides evenly. */
-(id) mpIntegerByDividingMPIntegerExactly: (MPInteger *) op;
-(id) mpIntegerByDividingUnsignedIntExactly: (unsigned long int) op;

/* adjustable division: These methods combine the exact and inexact division
 * methods, calling the one that is appropriate based on the 'exactly'
 * boolean. */
-(id) mpIntegerByDividingMPInteger: (MPInteger *) op
                           exactly: (BOOL) ex;
-(id) mpIntegerByDividingUnsignedInt: (unsigned long int) op
                             exactly: (BOOL) ex;

/* modulo: These methods return a new MPInteger containing the value of an
 * equivalent MPInteger in the modulo set specified in the argument. */
-(id) mpIntegerByModuloMPInteger: (MPInteger *) op;
-(id) mpIntegerByModuloUnsignedInt: (unsigned long int) op;

/* divisibility: These methods check divisibility by the following logic: they
 * return YES if there exists an integer q such that n = qd (n being the
 * reciever and d being the argument). */
-(BOOL) isDivisibleByMPInteger: (MPInteger *) op;
-(BOOL) isDivisibleByUnsignedInt: (unsigned long int) op;

@end

@interface MPMutableInteger (Division)

/* inexact division: These methods divide the MPInteger by the value of the
 * argument. The quotient is truncated. */
-(void) divideMPInteger: (MPInteger *) op;
-(void) divideUnsignedInt: (unsigned long int) op;

/* exact division: These methods act as their immutable couterparts above,
 * dividing the MPInteger by the argument quickly, assuming the division is
 * exact. */
-(void) divideMPIntegerExactly: (MPInteger *) op;
-(void) divideUnsignedIntExactly: (unsigned long int) op;

/* adjustable division: These methods are interfaces to the two types of
 * division, as in the immutable case. */
-(void) divideMPInteger: (MPInteger *) op
                exactly: (BOOL) ex;
-(void) divideUnsignedInt: (unsigned long int) op
                  exactly: (BOOL) ex;

/* modulo: These methods execute the modulo operation on the MPInteger. */
-(void) moduloMPInteger: (MPInteger *) op;
-(void) moduloUnsignedInt: (unsigned long int) op;

@end

