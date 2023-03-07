//
//  HUMNTestConsumer.h
//  SwiftImplementationsTests
//
//  Created by Dave Rahardja on 3/6/23.
//

#import <Foundation/Foundation.h>
#import <SwiftImplementations/SwiftImplementations.h>

NS_ASSUME_NONNULL_BEGIN

/// A test class to test consuming objects across language boundaries.
@interface HUMNTestConsumer : NSObject

/// Accepts a ``HUMNArithmetic`` object.
///
/// Verifies that calling ``sumOfValues`` returns 42.
- (void)acceptArithmetic:(HUMNArithmetic *)arithmetic;

/// Accepts an enumeration.
///
/// Verifies that the enumeration passed in is ``Enumerations/one``.
- (void)acceptEnumeration:(HUMNEnumeration)enumeration;

/// Accepts an implementation of a protocol.
- (void)acceptSubtraction:(id<HUMNSubtraction>)subtraction;

@end

NS_ASSUME_NONNULL_END
