/**
 * Get.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 */

#import "Get.h"

@implementation MPInteger (Get)

-(mpz_t const * const) contentsPointer
{
  return (mpz_t const * const)&_contents;
}

@end

@implementation MPMutableInteger (Get)

-(mpz_t *) mutableContentsPointer
{
  return &_contents;
}

@end

