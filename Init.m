/**
 * Init.m
 *
 * This file is part of the MPInteger library
 * Distributed under the GNU General Public License
 *
 * Written by Bill Garrison
 * Last changed 2008 Dec 22
 */

#import "Init.h"

@implementation MPInteger (Init)

-(id) init
{
  [super init];
  /* Always mpz_clear first to be sure we aren't initializing over something
   * else and leaking memory. I'm sure we're leaking enough memory elsewhere,
   * and this one is fairly easy, so we'll try to stick to it before the RAM
   * usage gets out of control. */
  mpz_clear( _contents );
  mpz_init( _contents );
  [[self class] initRandomState];
  return self;
}

-(id) initWithMPInteger: (MPInteger *) op
{
  [self init];
  mpz_clear( _contents );
  mpz_init_set( _contents, *[op contentsPointer] );
  return self;
}

-(id) initWithUnsignedInt: (unsigned long int) op
{
  [self init];
  mpz_clear( _contents );
  mpz_init_set_ui( _contents, op );
  return self;
}

-(id) initWithString: (char *) str inBase: (int) base
{
  [self init];
  mpz_clear( _contents );
  mpz_init_set_str( _contents, str, base );
  return self;
}

-(id) initWithString: (char *) str
{
  /* When mpz_set_str recieves 0 for base, it guesses based on the content of
   * the string (see Init.h or gmp documentation) */
  return [self initWithString: str inBase: 0];
}

-(id) initWithMpz: (mpz_t) op
{
  [self init];
  mpz_clear( _contents );
  mpz_init_set( _contents, op );
  return self;
}

+(id) mpIntegerWithMPInteger: (MPInteger *) op
{
  return [[self alloc] initWithMPInteger: op];
}

+(id) mpIntegerWithUnsignedInt: (unsigned long int) op
{
  return [[self alloc] initWithUnsignedInt: op];
}

+(id) mpIntegerWithString: (char *) str inBase: (int) base
{
  return [[self alloc] initWithString: str inBase: base];
}

+(id) mpIntegerWithString: (char *) str
{
  return [[self alloc] initWithString: str];
}

+(id) mpIntegerWithMpz: (mpz_t) op
{
  return [[self alloc] initWithMpz: op];
}

@end

