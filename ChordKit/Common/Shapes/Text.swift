//
//  Text.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct Text {

    public var coord: Point
    public var size: Int
    public var text: String

    public init(coord: Point, size: Int, text: String) {
        self.coord = coord
        self.size = size
        self.text = text
    }

}

// MARK: - Text+Shape

extension Text: Shape {

    public var xml: String {
        return "<text x=\"\(coord.x)\" y=\"\(coord.y)\" font-family=\"Helvetica\" font-size=\"\(size)\" fill=\"black\" >\(text)</text>"
    }
    
}
