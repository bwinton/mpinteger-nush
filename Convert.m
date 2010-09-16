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

-(NSString *) stringValue
{
  return [self stringValueInBase: 10];
}

-(NSString *) stringValueInBase: (int) base
{
  return [NSString stringWithCString: mpz_get_str( NULL, base, *[self contentsPointer] )
                   encoding: NSASCIIStringEncoding];
}

@end

@implementation MPMutableInteger (Convert)

-(void) makeImmutable
{
  MPInteger *temp = [[MPInteger alloc] initWithMPInteger: self];
  [self release];
  self = [[MPInteger alloc] initWithMPInteger: temp];
  [temp release];
}

@end

