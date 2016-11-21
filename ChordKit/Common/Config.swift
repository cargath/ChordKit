//
//  Config.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct Config {

    static let scale: Int = 20

    static let cols: Int = 7
    static let rows: Int = 7

    public static let colWidth = width / cols
    public static let rowHeight = height / rows

    public static let width: Int = cols * 3 * scale
    public static let height: Int = rows * 4 * scale

    public static let strokeWidth: Int = 4
    public static let radius = colWidth / 2 - strokeWidth
    
}
