//
//  Note.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public struct Note {

    public var fret: Int
    public var string: Int
    public var color: UIColor

    public init(fret: Int = -1, string: Int, color: UIColor = .black) {
        self.fret = fret
        self.string = string - 1
        self.color = color
    }

}

// MARK: - Note+Shapes

public extension Note {

    public func center(start: Point, end: Point, colWidth: Int, rowHeight: Int) -> Point {

        if fret <= 0 {
            return Point(start.x + string * colWidth, start.y + rowHeight / 2)
        }

        return Point(start.x + string * colWidth, start.y + rowHeight / 2 + fret * rowHeight)
    }

    public func shapes(start: Point, end: Point, colWidth: Int, rowHeight: Int, radius: Int, strokeWidth: Int) -> [Shape] {

        if string < 0 || string > 5 {
            return []
        }

        if (fret < 0) {
            return Line.cross(center: center(start: start, end: end, colWidth: colWidth, rowHeight: rowHeight), radius: radius, strokeWidth: strokeWidth)
        }

        if (fret == 0) {
            return [Circle(stroke: color, width: strokeWidth, center: center(start: start, end: end, colWidth: colWidth, rowHeight: rowHeight), radius: radius)]
        }

        return [Circle(fill: color, center: center(start: start, end: end, colWidth: colWidth, rowHeight: rowHeight), radius: radius)]
    }
    
}
