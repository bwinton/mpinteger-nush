/**
 * Compare.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 */

#import "Compare.h"

@implementation MPInteger (Compare)

-(MPIComparisonResult) compare: (MPInteger *) other
{
  if( mpz_cmp( *[self contentsPointer], *[other contentsPointer] ) > 0 )
    return MPIOrderedDescending;
  else if( mpz_cmp( *[self contentsPointer], *[other contentsPointer] ) < 0 )
    return MPIOrderedAscending;
  else
    return MPIOrderedSame;
}

-(BOOL) isEqualToMPInteger: (MPInteger *) other
{
  return ( [self compare: other] == MPIOrderedSame );
}

@end

