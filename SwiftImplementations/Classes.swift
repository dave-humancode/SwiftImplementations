//
//  Classes.swift
//  SwiftImplementations
//
//  Created by Dave Rahardja on 3/6/23.
//

import Foundation

/// A class that performs basic arithmetic.
@objc(HUMNArithmetic)
public class Arithmetic: NSObject {

    /// A value to operate on.
    @objc(valueA) public var a: Int = 0
    /// Another value to operate on.
    @objc(valueB) public var b: Int = 0

    /// Sum of ``a`` and ``b``
    @objc(sumOfValues) public var sum: Int {
        get { a + b }
    }

    /// Add a value to the existing values.
    ///
    /// This function is only visible to Swift.
    ///
    /// - Parameters:
    ///   - c: The value to add to ``a`` and ``b``.
    /// - Returns: the sum of ``a``, ``b``, and `c`.
    public func sumOfValuesAnd(_ c: Int) -> Int {
        return a + b + c
    }
}

// Extension containing Objc-only functions
extension Arithmetic {
    /// Add a value to the existing values.
    ///
    /// This function is only visible to ObjC. Note the `private` visibility.
    ///
    /// - Parameters:
    ///   - c: The value to add to ``a`` and ``b``.
    /// - Returns: the sum of ``a``, ``b``, and `c`.
    @objc(sumOfValuesAndValue:)
    private func objc_sumOfValuesAnd(_ c: Int) -> Int {
        return a + b + c
    }
}

// Extension supporting multiplication
@objc extension Arithmetic {
    @objc public var product: Int {
        get { a * b }
    }

    @objc(multiplyValuesAndValue:)
    public func multiplyValuesAnd(_ c: Int) -> Int {
        return a * b * c
    }
}

@_cdecl("addAToB") public func add(_ a: Int, to b: Int) -> Int {
    return a + b
}
