/**
 * Arithmetic.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 */

#import "Arithmetic.h"

@implementation MPInteger (Arithmetic)

-(id) mpIntegerByAddingMPInteger: (MPInteger *) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_add( temp, *[self contentsPointer], *[op contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByAddingUnsignedInt: (unsigned long int) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_add_ui( temp, *[self contentsPointer], op );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerBySubtractingMPInteger: (MPInteger *) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_sub( temp, *[self contentsPointer], *[op contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerBySubtractingUnsignedInt: (unsigned long int) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_sub_ui( temp, *[self contentsPointer], op );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByMultiplyingMPInteger: (MPInteger *) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_mul( temp, *[self contentsPointer], *[op contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByMultiplyingUnsignedInt: (unsigned long int) op
{
  mpz_t temp;
  mpz_init( temp );
  mpz_mul_ui( temp, *[self contentsPointer], op );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByNegating
{
  mpz_t temp;
  mpz_init( temp );
  mpz_neg( temp, *[self contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

-(id) mpIntegerByAbsoluteValue
{
  mpz_t temp;
  mpz_init( temp );
  mpz_abs( temp, *[self contentsPointer] );
  MPInteger * answer = [[[self class] alloc] initWithMpz: temp];
  mpz_clear( temp );
  return answer;
}

@end

@implementation MPMutableInteger (Arithmetic)

-(void) addMPInteger: (MPInteger *) op
{
  mpz_add( *[self mutableContentsPointer], *[self contentsPointer],
          *[op contentsPointer] );
}

-(void) addUnsignedInt: (unsigned long int) op
{
  mpz_add_ui( *[self mutableContentsPointer], *[self contentsPointer], op );
}

-(void) subtractMPInteger: (MPInteger *) op
{
  mpz_sub( *[self mutableContentsPointer], *[self contentsPointer],
          *[op contentsPointer] );
}

-(void) subtractUnsignedInt: (unsigned long int) op
{
  mpz_sub_ui( *[self mutableContentsPointer], *[self contentsPointer], op );
}

-(void) multiplyMPInteger: (MPInteger *) op
{
  mpz_mul( *[self mutableContentsPointer], *[self contentsPointer],
          *[op contentsPointer] );
}

-(void) multiplyUnsignedInt: (unsigned long int) op
{
  mpz_mul_ui( *[self mutableContentsPointer], *[self contentsPointer], op );
}

-(void) negate
{
  mpz_neg( *[self mutableContentsPointer], *[self contentsPointer] );
}

-(void) absoluteValue
{
  mpz_abs( *[self mutableContentsPointer], *[self contentsPointer] );
}

@end

