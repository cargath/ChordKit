//
//  Line.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public struct Line {

    public var start: Point
    public var end: Point
    public var stroke: UIColor
    public var strokeWidth: Int

    public init(start: Point, end: Point, stroke: UIColor = .black, strokeWidth: Int) {
        self.start = start
        self.end = end
        self.stroke = stroke
        self.strokeWidth = strokeWidth
    }

}

// MARK: - Line+Cross

public extension Line {

    public static func cross(center: Point, radius: Int, strokeWidth: Int) -> [Line] {
        return [
            Line(start: Point(center.x - radius, center.y - radius), end: Point(center.x + radius, center.y + radius), strokeWidth: strokeWidth),
            Line(start: Point(center.x + radius, center.y - radius), end: Point(center.x - radius, center.y + radius), strokeWidth: strokeWidth)
        ]
    }

}

// MARK: - Line+Shape

extension Line: Shape {

    public var xml: String {
        return "<line x1=\"\(start.x)\" y1=\"\(start.y)\" x2=\"\(end.x)\" y2=\"\(end.y)\" stroke=\"\(stroke.hexString())\" stroke-width=\"\(strokeWidth)\" />"
    }
    
}
