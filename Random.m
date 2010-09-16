/**
 * Random.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 */

#import "Random.h"

@implementation MPInteger (Random)

+(void) initRandomState
{
  if( !_mpiRandomStateInitialized )
  {
    gmp_randinit_default( _mpiRandomState );
    /* THIS SEED SUCKS */
    gmp_randseed_ui( _mpiRandomState, time( NULL ) );
    _mpiRandomStateInitialized = YES;
  }
}

@end

@implementation MPMutableInteger (Random)

-(void) setWithRandomNumberWithBits: (unsigned int) b
{
  mpz_urandomb( *[self mutableContentsPointer], _mpiRandomState, b );
}

@end

