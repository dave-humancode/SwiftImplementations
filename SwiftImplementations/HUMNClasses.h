//
//  HUMNClasses.h
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
HUMN_INTERFACE_IMPLEMENTED_IN_SWIFT(Arithmetic, SwiftImplementations)
@interface HUMNArithmetic : NSObject

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

/// A category that adds multiplication to ``HUMNArithmetic``
HUMN_IMPLEMENTED_IN_SWIFT(SwiftImplementations)
@interface HUMNArithmetic (Multiplication)

/// The product of ``valueA`` and ``valueB``.
@property (nonatomic, readonly) NSInteger product;

/// Multiply ``valueA``, ``valueB``, and `valueC`.
- (NSInteger)productOfValuesAndValue:(NSInteger)valueC;

@end

/// Add two numbers.
HUMN_IMPLEMENTED_IN_SWIFT(SwiftImplementations)
extern NSInteger addAToB(NSInteger a, NSInteger b);

NS_ASSUME_NONNULL_END
