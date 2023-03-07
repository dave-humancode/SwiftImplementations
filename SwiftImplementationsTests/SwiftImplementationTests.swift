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

    /// A subclass
    ///
    /// ``Arithmetic`` can still be subclassed in Swift although it is not
    /// subclassable in Objective-C.
    class Divider: Arithmetic {
        public var quotient: Int {
            get { a / b }
        }
    }

    func testSubclass() {
        let divider = Divider()
        divider.a = 15
        divider.b = 3
        XCTAssertEqual(divider.quotient, 5)
        XCTAssertEqual(divider.sum, 18)
    }
}
