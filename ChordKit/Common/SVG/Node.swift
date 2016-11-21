//
//  Node.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

open class Node: CustomStringConvertible, Printable {

    public var parent: Node?
    public var children: [Node]

    public var isRoot: Bool {
        return parent == nil
    }

    public var isLeaf: Bool {
        return children.isEmpty
    }

    public init(children: [Node]) {

        self.children = children

        for child in children {
            child.parent = self
        }
    }

    // MARK: CustomStringConvertible

    open var description: String {
        return "Node"
    }

    // MARK: Printable

    open func print(depth: UInt = 0) -> String {

        let desc = depth.indentation + "\(description)\n"

        if isLeaf {
            return desc
        }

        return children.map({ $0.print(depth: depth + 1) }).reduce("", +)
    }
    
}
