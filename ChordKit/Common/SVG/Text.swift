//
//  Text.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public class Text: Node {

    public var coord: Point
    public var size: Int
    public var text: String

    public init(coord: Point, size: Int = Config.radius * 2, text: String) {

        self.coord = coord
        self.size = size
        self.text = text

        super.init(children: [])
    }

    // MARK: CustomStringConvertible

    override public var description: String {
        return "<text x=\"\(coord.x)\" y=\"\(coord.y)\" font-family=\"Helvetica\" font-size=\"\(size)\" fill=\"black\" >\(text)</text>"
    }
    
}
