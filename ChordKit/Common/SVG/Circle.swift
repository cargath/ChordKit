//
//  Circle.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public class Circle: Node {

    public var center: Point
    public var radius: Int
    public var fill: Color
    public var stroke: Color
    public var strokeWidth: Int

    public init(fill: Color, center: Point, radius: Int = Config.radius) {

        self.center = center
        self.radius = radius
        self.fill = fill
        self.stroke = .black
        self.strokeWidth = 0

        super.init(children: [])
    }

    public init(stroke: Color, width: Int = Config.strokeWidth, center: Point, radius: Int = Config.radius) {

        self.center = center
        self.radius = radius - width / 2
        self.fill = .white
        self.stroke = stroke
        self.strokeWidth = width

        super.init(children: [])
    }

    // MARK: CustomStringConvertible

    override public var description: String {
        return "<circle cx=\"\(center.x)\" cy=\"\(center.y)\" r=\"\(radius)\" fill=\"\(fill.rawValue)\" stroke=\"\(stroke.rawValue)\" stroke-width=\"\(strokeWidth)\" />"
    }
    
}
