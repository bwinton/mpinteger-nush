/**
 * Set.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Oct 09
 */

#import "Set.h"

@implementation MPMutableInteger (Set)

-(void) setWithMPInteger: (MPInteger *) op
{
  mpz_set( *[self mutableContentsPointer], *[op contentsPointer] );
}

-(void) setWithUnsignedInt: (unsigned long int) op
{
  mpz_set_ui( *[self mutableContentsPointer], op );
}

-(void) setWithString: (char *) str
{
  /* When mpz_set_str recieves 0 for base, it guesses based on the content of
   * the string (see Set.h or gmp documentation) */
  [self setWithString: str inBase: 0];
}

-(void) setWithString: (char *) str inBase: (int) base
{
  mpz_set_str( *[self mutableContentsPointer], str, base );
}

@end

