/**
 * NumberTheory.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 *
 * This file includes number theoretic methods for MPInteger objects.
 */

#import "Declare.h"
#import "Get.h"
#import "Init.h"

#define MPI_DEFAULT_PRIME_REPS 15

@interface MPInteger (NumberTheory)

-(BOOL) isProbablyPrime;

-(BOOL) isProbablyPrimeAfterIterating: (unsigned int) reps;

-(id) mpIntegerByInverseModulo: (MPInteger *) mod;

@end

