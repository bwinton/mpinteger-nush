/**
 * Compare.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 *
 * This file includes methods to compare MPInteger objects.
 */

#import "Declare.h"
#import "Get.h"

/* MPIComparisonResult is an enum used as a result of comparisons. It is modeled
 * after and compatible with NSComparisonResult. */
typedef enum _MPIComparisonResult
{ 
  MPIOrderedAscending = -1,
  MPIOrderedSame,
  MPIOrderedDescending
}
MPIComparisonResult;

@interface MPInteger (Compare)

/* compare: returns MPIOrderedAscending if caller < other, MPIOrderedDescending
 * if caller > other, or MPIOrderedSame if caller = other. */
-(MPIComparisonResult) compare: (MPInteger *) other;

/* equal: returns true if caller and other are equal, false otherwise. */
-(_Bool) isEqualToMPInteger: (MPInteger *) other;

@end

