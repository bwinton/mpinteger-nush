/**
 * Declare.h
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 21
 *
 * This file declares the MPInteger class and provides methods alloc and dealloc.
 */

#import <stdio.h>
#import <Foundation/Foundation.h>
#import <gmp.h>

/* MPInteger class
 * The only data in a MPInteger object is the mpz_t. It holds the integer
 * value and is controlled by the gmp library. */
@interface MPInteger: NSObject
{
@protected
  mpz_t _contents;
}

/* standard methods alloc and dealloc */
+(id) alloc;
-(void) dealloc;
-(NSString *) help;

@end

/* MPMutableInteger class
 * No extra data beyond the inherited mpz_t. Has its own methods to change the
 * value of the MPInteger after initialization (implements mutability) */
@interface MPMutableInteger: MPInteger

@end

