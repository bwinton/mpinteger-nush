/**
 * Constants.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 */

#import "Constants.h"

@implementation MPInteger (Constants)

+(id) zero
{
  return [self mpIntegerWithUnsignedInt: 0];
}

+(id) one
{
  return [self mpIntegerWithUnsignedInt: 1];
}

+(id) googol
{
  MPMutableInteger *temp = [MPMutableInteger mpIntegerWithUnsignedInt: 10];
  [temp raiseToExponentUnsignedInt: 100];
  id answer = [self mpIntegerWithMPInteger: temp];
  [temp free];
  return answer;
}

@end

