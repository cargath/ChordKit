//
//  Circle.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public struct Circle {

    public var center: Point
    public var radius: Int
    public var fill: UIColor
    public var stroke: UIColor
    public var strokeWidth: Int

    public init(fill: UIColor, center: Point, radius: Int) {
        self.center = center
        self.radius = radius
        self.fill = fill
        self.stroke = .black
        self.strokeWidth = 0
    }

    public init(stroke: UIColor, width: Int, center: Point, radius: Int) {
        self.center = center
        self.radius = radius - width / 2
        self.fill = .white
        self.stroke = stroke
        self.strokeWidth = width
    }

}

// MARK: - Circle+Shape

extension Circle: Shape {

    public var xml: String {
        return "<circle cx=\"\(center.x)\" cy=\"\(center.y)\" r=\"\(radius)\" fill=\"\(fill.hexString())\" stroke=\"\(stroke.hexString())\" stroke-width=\"\(strokeWidth)\" />"
    }
    
}
