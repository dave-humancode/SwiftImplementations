//
//  SwiftImplementationsTests.m
//  SwiftImplementationsTests
//
//  Created by Dave Rahardja on 3/6/23.
//

#import <XCTest/XCTest.h>
#import <SwiftImplementations/SwiftImplementations.h>
#import "HUMNTestConsumer.h"

@interface SwiftImplementationsTests : XCTestCase

@end

@implementation SwiftImplementationsTests

- (void)testArithmetic
{
    HUMNArithmetic *arithmetic = [[HUMNArithmetic alloc] init];
    arithmetic.valueA = 10;
    arithmetic.valueB = 32;
    XCTAssertEqual(arithmetic.sumOfValues, 42);
    XCTAssertEqual([arithmetic sumOfValuesAndValue:4], 46);
    XCTAssertEqual(arithmetic.productOfValues, 320);
}

- (void)testFunction
{
    XCTAssertEqual(addTwoNumbers(4, 10), 14);
}

@end
