//
//  SVG.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public class SVG: Node {

    public var width: Int
    public var height: Int

    var open: String {
        return "<svg width=\"\(width)\" height=\"\(height)\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">"
    }

    var close: String {
        return "</svg>"
    }

    public init (width: Int = Config.width, height: Int = Config.height + Config.strokeWidth / 2, children: [Node]) {

        self.width = width
        self.height = height

        super.init(children: children)
    }

    // MARK: Printable

    override public func print(depth: UInt = 0) -> String {

        if isLeaf {
            return "\(depth.indentation)\(open)>\(close)\n"
        }

        return "\(open)>\n\(children.map({ $0.print(depth: depth + 1) }).reduce("", +))\(close)\n"
    }
    
}
