//
//  UnorderedOperation.swift
//  Bond
//
//  Created by Srdan Rasic on 05/10/2018.
//  Copyright © 2018 Swift Bond. All rights reserved.
//

import Foundation

public enum UnorderedOperation<Element, Index> {

    case insert(Element, at: Index)
    case delete(at: Index)
    case update(at: Index, newElement: Element)
}

public enum AnyUnorderedOperation<Index> {

    case insert(at: Index)
    case delete(at: Index)
    case update(at: Index)
}

extension UnorderedOperation {

    public var asAnyUnorderedOperation: AnyUnorderedOperation<Index> {
        switch self {
        case .insert(_, let at):
            return .insert(at: at)
        case .delete(let at):
            return .delete(at: at)
        case .update(let at, _):
            return .update(at: at)
        }
    }
}

extension UnorderedOperation: CustomDebugStringConvertible {

    public var debugDescription: String {
        switch self {
        case .insert(let element, let at):
            return "I(\(element), at: \(at))"
        case .delete(let at):
            return "D(at: \(at))"
        case .update(let at, let newElement):
            return "U(at: \(at), with: \(newElement))"
        }
    }
}
