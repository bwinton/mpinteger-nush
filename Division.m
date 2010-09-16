/**
 * Division.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 */

#import "Division.h"

@implementation MPInteger (Division)

-(id) mpIntegerByDividingMPInteger: (MPInteger *) op;
{
  return [self mpIntegerByDividingMPInteger: op exactly: NO];
}

-(id) mpIntegerByDividingUnsignedInt: (unsigned long int) op;
{
  return [self mpIntegerByDividingUnsignedInt: op exactly: NO];
}

-(id) mpIntegerByDividingMPIntegerExactly: (MPInteger *) op
{
  return [self mpIntegerByDividingMPInteger: op exactly: YES];
}

-(id) mpIntegerByDividingUnsignedIntExactly: (unsigned long int) op
{
  return [self mpIntegerByDividingUnsignedInt: op exactly: YES];
}

-(id) mpIntegerByDividingMPInteger: (MPInteger *) op
                           exactly: (_Bool) ex
{
  mpz_t temp;
  mpz_init( temp );
  if( ex )
    mpz_divexact( temp, *[self contentsPointer], *[op contentsPointer] );
  else
    mpz_tdiv_q( temp, *[self contentsPointer], *[op contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByDividingUnsignedInt: (unsigned long int) op
                             exactly: (_Bool) ex
{
  mpz_t temp;
  mpz_init( temp );
  if( ex )
    mpz_divexact_ui( temp, *[self contentsPointer], op );
  else
    mpz_tdiv_q_ui( temp, *[self contentsPointer], op );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByModuloMPInteger: (MPInteger *) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_mod( temp, *[self contentsPointer], *[op contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByModuloUnsignedInt: (unsigned long int) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_mod_ui( temp, *[self contentsPointer], op );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(_Bool) isDivisibleByMPInteger: (MPInteger *) op
{
  if( mpz_divisible_p( *[self contentsPointer], *[op contentsPointer] ) == 0 )
    return NO;
  else
    return YES;
}

-(_Bool) isDivisibleByUnsignedInt: (unsigned long int) op
{
  if( mpz_divisible_ui_p( *[self contentsPointer], op ) == 0 )
    return NO;
  else
    return YES;
}

@end

@implementation MPMutableInteger (Division)

-(void) divideMPInteger: (MPInteger *) op
{
  [self divideMPInteger: op exactly: NO];
}

-(void) divideUnsignedInt: (unsigned long int) op
{
  [self divideUnsignedInt: op exactly: NO];
}

-(void) divideMPIntegerExactly: (MPInteger *) op
{
  [self divideMPInteger: op exactly: YES];
}

-(void) divideUnsignedIntExactly: (unsigned long int) op
{
  [self divideUnsignedInt: op exactly: YES];
}

-(void) divideMPInteger: (MPInteger *) op
                exactly: (_Bool) ex
{
  if( ex )
    mpz_divexact( *[self mutableContentsPointer], *[self contentsPointer],
                 *[op contentsPointer] );
  else
    mpz_tdiv_q( *[self mutableContentsPointer], *[self contentsPointer],
               *[op contentsPointer] );
}

-(void) divideUnsignedInt: (unsigned long int) op
                exactly: (_Bool) ex
{
  if( ex )
    mpz_divexact_ui( *[self mutableContentsPointer], *[self contentsPointer],
                    op );
  else
    mpz_tdiv_q_ui( *[self mutableContentsPointer], *[self contentsPointer],
                  op );
}

-(void) moduloMPInteger: (MPInteger *) op
{
  mpz_mod( *[self mutableContentsPointer], *[self contentsPointer],
          *[op contentsPointer] );
}

-(void) moduloUnsignedInt: (unsigned long int) op
{
  mpz_mod_ui( *[self mutableContentsPointer], *[self contentsPointer], op );
}

@end

