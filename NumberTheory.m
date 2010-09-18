/**
 * NumberTheory.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 22
 */

#import "NumberTheory.h"

@implementation MPInteger (NumberTheory)

-(BOOL) isProbablyPrime
{
  return [self isProbablyPrimeAfterIterating: MPI_DEFAULT_PRIME_REPS];
}

-(BOOL) isProbablyPrimeAfterIterating: (unsigned int) reps
{
  if( mpz_probab_prime_p( *[self contentsPointer], reps ) > 0 )
    return YES;
  else
    return NO;
}

-(id) mpIntegerByInverseModulo: (MPInteger *) mod
{
  mpz_t temp;
  mpz_init( temp );
  mpz_invert( temp, *[self contentsPointer], *[mod contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

@end

