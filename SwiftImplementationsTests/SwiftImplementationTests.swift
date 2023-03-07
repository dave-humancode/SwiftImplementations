//
//  SwiftImplementationTests.swift
//  SwiftImplementationsTests
//
//  Created by Dave Rahardja on 3/6/23.
//

import XCTest

final class SwiftImplementationTests: XCTestCase {

    func testArithmetic() {
        let arithmetic = Arithmetic()
        arithmetic.a = 10
        arithmetic.b = 32

        let consumer = HUMNTestConsumer()
        consumer.accept(arithmetic)

        XCTAssertEqual(arithmetic.sumOfValuesAnd(4), 46)
        XCTAssertEqual(arithmetic.product, 320)
    }

    func testFunction() {
        XCTAssertEqual(addNumber(4, to:10), 14)
    }

    func testEnumeration() {
        let consumer = HUMNTestConsumer()
        consumer.accept(.one)
    }

    /// A class implementing a protocol
    class Subtractor: NSObject, Subtraction {
        func subtract(_ a: Int, from b: Int) -> Int {
            return b - a;
        }
    }

    func testSubtraction() {
        let consumer = HUMNTestConsumer()
        let subtractor = Subtractor()
        consumer.accept(subtractor)
    }
}
