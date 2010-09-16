/**
 * Convert.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 22
 */

#import "Convert.h"

@implementation MPInteger (Convert)

-(signed long int) intValue
{
  return mpz_get_si( *[self contentsPointer] );
}

-(unsigned long int) unsignedIntValue
{
  return mpz_get_ui( *[self contentsPointer] );
}

-(double) doubleValue
{
  return mpz_get_d( *[self contentsPointer] );
}

-(char *) stringValue
{
  return [self stringValueInBase: 10];
}

-(char *) stringValueInBase: (int) base
{
  return mpz_get_str( NULL, base, *[self contentsPointer] );
}

@end

@implementation MPMutableInteger (Convert)

-(void) makeImmutable
{
  MPInteger *temp = [[MPInteger alloc] initWithMPInteger: self];
  [self free];
  self = [[MPInteger alloc] initWithMPInteger: temp];
  [temp free];
}

@end

