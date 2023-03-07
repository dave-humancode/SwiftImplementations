//
//  HUMNTestConsumer.m
//  SwiftImplementationsTests
//
//  Created by Dave Rahardja on 3/6/23.
//

#import <XCTest/XCTest.h>
#import "HUMNTestConsumer.h"

@implementation HUMNTestConsumer

- (void)acceptArithmetic:(HUMNArithmetic *)arithmetic
{
    XCTAssertEqual(arithmetic.sumOfValues, 42);
}

- (void)acceptEnumeration:(HUMNEnumeration)enumeration
{
    XCTAssertEqual(enumeration, HUMNEnumerationOne);
}

- (void)acceptSubtraction:(id<HUMNSubtraction>)subtraction
{
    XCTAssertEqual([subtraction subtractValue:5 fromValue:15], 10);
}

@end
