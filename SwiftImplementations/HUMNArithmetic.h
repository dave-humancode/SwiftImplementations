//
//  HUMNArithmetic.h
//  SwiftImplementations
//
//  Created by Dave Rahardja on 3/6/23.
//

#import <Foundation/Foundation.h>
#import <SwiftImplementations/Defines.h>

NS_ASSUME_NONNULL_BEGIN

/// A class that performs basic arithmetic.
///
/// - Note: This is an ObjC interface to a Swift implementation.
HUMN_CLASS_IMPLEMENTED_IN_SWIFT(Arithmetic, SwiftImplementations)
@interface HUMNArithmetic

/// A value to operate on.
@property (nonatomic) NSInteger valueA;
/// Another value to operate on.
@property (nonatomic) NSInteger valueB;

/// Sum of ``valueA`` and ``valueB``
@property (nonatomic, readonly) NSInteger sumOfValues;

/// Add a value to the existing values.
///
/// - Parameters:
///   - valueC: The value to add to ``valueA`` and ``valueB``.
/// - Returns: The sum of ``valueA``, ``valueB``, and `valueC`.
- (NSInteger)sumOfValuesAndValue:(NSInteger)valueC;

@end

NS_ASSUME_NONNULL_END
