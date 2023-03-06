//
//  HUMNProtocols.h
//  SwiftImplementations
//
//  Created by Dave Rahardja on 3/6/23.
//

#import <Foundation/Foundation.h>
#import <SwiftImplementations/Defines.h>

NS_ASSUME_NONNULL_BEGIN

/// A protocol that encapsulates subtraction.
HUMN_INTERFACE_IMPLEMENTED_IN_SWIFT(Subtraction, SwiftImplementations)
@protocol HUMNSubtraction <NSObject>

/// Subtract one value from another.
- (NSInteger)subtractValue:(NSInteger)valueA fromValue:(NSInteger)valueB;

@end

NS_ASSUME_NONNULL_END
