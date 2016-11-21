//
//  Line.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public class Line: Node {

    public var start: Point
    public var end: Point
    public var strokeWidth: Int

    public init(start: Point, end: Point, strokeWidth: Int = Config.strokeWidth) {

        self.start = start
        self.end = end
        self.strokeWidth = strokeWidth

        super.init(children: [])
    }

    // MARK: CustomStringConvertible

    override public var description: String {
        return "<line x1=\"\(start.x)\" y1=\"\(start.y)\" x2=\"\(end.x)\" y2=\"\(end.y)\" stroke=\"black\" stroke-width=\"\(strokeWidth)\" />"
    }
    
}
