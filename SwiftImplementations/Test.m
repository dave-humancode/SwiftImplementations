//
//  Test.m
//  SwiftImplementations
//
//  Created by Dave Rahardja on 3/6/23.
//

#import <Foundation/Foundation.h>
#import <SwiftImplementations/SwiftImplementations.h>

void testTheThing(void);

void testTheThing() {
    NSInteger b __unused = addAToB(40, 2);

    HUMNArithmetic *arith = [[HUMNArithmetic alloc] init];
    arith.valueA = 10;
    arith.valueB = 20;
    NSInteger product = arith.product;
    NSInteger moreProduct = [arith productOfValuesAndValue:50];
}
