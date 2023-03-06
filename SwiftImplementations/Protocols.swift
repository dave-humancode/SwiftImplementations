//
//  Protocols.swift
//  SwiftImplementations
//
//  Created by Dave Rahardja on 3/6/23.
//

import Foundation

/// A protocol that encapsulates subtraction.
@objc(HUMNSubtraction)
public protocol Subtraction: NSObjectProtocol {

    /// Subtract one value from another.
    @objc(subtractValue:fromValue:)
    func subtract(_ a: Int, from b: Int) -> Int
}
