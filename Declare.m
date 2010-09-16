/**
 * Declare.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 */

#import "Declare.h"

@implementation MPInteger

+(id) alloc
{
  /* Nothing fancy to do here, really. Elected to allocate / initialize the
   * mpz_t contents in one step during the init phase rather than here. */
  return [super alloc];
}

-(void) dealloc
{
  /* free the data in the mpz_t before letting the MPInteger go */
  mpz_clear( _contents );
  [super dealloc];
}

- (NSString *) help
{
  return @"This is an instance of MPInteger";
}

@end

@implementation MPMutableInteger

- (NSString *) help
{
  return @"This is an instance of MPInteger";
}

@end

