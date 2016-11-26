//
//  SVG.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct SVG {

    public let width: Int
    public let height: Int

    public init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

}

// MARK: - SVG+Shape

extension SVG: Shape {

    public var xml: String {
        return "<svg width=\"\(width)\" height=\"\(height)\">"
    }
    
}
