/**
 * Random.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 *
 * This file includes random number generator methods for MPInteger objects.
 */

#import "Declare.h"
#import "Get.h"

#import <time.h>

static gmp_randstate_t _mpiRandomState;
static _Bool _mpiRandomStateInitialized = NO;

@interface MPInteger (Random)

+(void) initRandomState;

@end

@interface MPMutableInteger (Random)

-(void) setWithRandomNumberWithBits: (unsigned int) b;

@end

