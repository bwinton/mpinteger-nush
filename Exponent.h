/**
 * Exponent.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Oct 09
 *
 * This file includes exponentiation methods.
 */

#import "Declare.h"
#import "Get.h"
#import "Init.h"

@interface MPInteger (Exponent)

/* There is no supplied method in gmplib to do this. I'm thinking about
 * converting the exponent to an unsigned int (after checking that it can fit
 * in one, but if it can't I don't know what to do) and using mpz_pow_ui.
 * Another option could be to use mpz_powm using a sufficiently huge modulo
 * (maybe infinity? Is that possible?) or zero (would that work?). *
-(id) mpIntegerByRaisingToExponentMPInteger: (MPInteger *) op;
 */

/* exponentiation: These methods create a new MPInteger that contains the value
 * of the original MPInteger raised to the exponent specified as an argument. */
-(id) mpIntegerByRaisingToExponentUnsignedInt: (unsigned long int) op;

/* modular exponentiation: These methods create a new MPInteger exponentiated
 * in modular arithmetic using the given modulo. */
-(id) mpIntegerByRaisingToExponentMPInteger: (MPInteger *) op
                               modMPInteger: (MPInteger *) mod;
-(id) mpIntegerByRaisingToExponentUnsignedInt: (unsigned long int) op
                                 modMPInteger: (MPInteger *) mod;

@end

@interface MPMutableInteger (Exponent)

/* This relies on mpIntegerByRaisingToExponentMPInteger (see above) *
 -(void) raiseToExponentMPInteger: (MPInteger *) op;
 */

/* exponentiation: These methods raise the given MPInteger to the specified
 * exponent. */
-(void) raiseToExponentUnsignedInt: (unsigned long int) op;

/* modular exponentiation: These methods raise the MPInteger to the specified
 * exponent using modular arithmetic. */
-(void) raiseToExponentMPInteger: (MPInteger *) op
                    modMPInteger: (MPInteger *) mod;
-(void) raiseToExponentUnsignedInt: (unsigned long int) op
                      modMPInteger: (MPInteger *) mod;

@end

