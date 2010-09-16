/**
 * Exponent.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 22
 */

#import "Exponent.h"

@implementation MPInteger (Exponent)

/*
-(id) mpIntegerByRaisingToExponentMPInteger: (MPInteger *) op
{
  mpz_t temp;
  mpz_init( temp );
 // Why doesn't this function exist?
  mpz_pow( temp, *[self contentsPointer], *[op contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}*/

-(id) mpIntegerByRaisingToExponentUnsignedInt: (unsigned long int) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_pow_ui( temp, *[self contentsPointer], op );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByRaisingToExponentMPInteger: (MPInteger *) op
                               modMPInteger: (MPInteger *) mod
{
  mpz_t temp;
  mpz_init( temp );
  mpz_powm( temp, *[self contentsPointer], *[op contentsPointer],
           *[mod contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByRaisingToExponentUnsignedInt: (unsigned long int) op
                                 modMPInteger: (MPInteger *) mod
{
  mpz_t temp;
  mpz_init( temp );
  mpz_powm_ui( temp, *[self contentsPointer], op, *[mod contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

@end

@implementation MPMutableInteger (Exponent)

/*
-(void) raiseToExponentMPInteger: (MPInteger *) op
{
  mpz_pow( *[self mutableContentsPointer], *[self contentsPointer],
          *[op contentsPointer] );
}*/

-(void) raiseToExponentUnsignedInt: (unsigned long int) op
{
  mpz_pow_ui( *[self mutableContentsPointer], *[self contentsPointer], op );
}

-(void) raiseToExponentMPInteger: (MPInteger *) op
                    modMPInteger: (MPInteger *) mod
{
  mpz_powm( *[self mutableContentsPointer], *[self contentsPointer],
           *[op contentsPointer], *[mod contentsPointer] );
}

-(void) raiseToExponentUnsignedInt: (unsigned long int) op
                      modMPInteger: (MPInteger *) mod
{
  mpz_powm_ui( *[self mutableContentsPointer], *[self contentsPointer], op,
              *[mod contentsPointer] );
}

@end

