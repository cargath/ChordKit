//
//  Cross.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public class Cross: Node {

    public init(center: Point, radius: Int = Config.radius) {
        super.init(children: [
            Line(start: Point(center.x - radius, center.y - radius), end: Point(center.x + radius, center.y + radius)),
            Line(start: Point(center.x + radius, center.y - radius), end: Point(center.x - radius, center.y + radius))
        ])
    }
    
}
