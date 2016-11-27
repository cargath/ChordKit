//
//  Chord.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public struct Chord {

    public let name: String
    public let stringRepresentation: String
    public let notes: [Note]
    public let topOffset: Int
    public let cols: Int
    public let rows: Int

    public init(name: String, stringRepresentation: String, notes: [Note] = [], cols: Int, rows: Int) {

        self.name = name
        self.stringRepresentation = stringRepresentation
        self.notes = notes

        var topOffset: Int = 0

        if name.characters.count > 0 {
            topOffset += 1
        }

        for note in notes where note.fret < 1 {
            topOffset += 1
            break
        }

        self.topOffset = topOffset
        self.cols = cols
        self.rows = rows + topOffset
    }

    public init(name: String = "", chord: String, cols: Int = 7, rows: Int = 6) {
        self.init(name: name, stringRepresentation: chord, notes: chord.chord, cols: cols, rows: rows)
    }

    public init(name: String = "", scale: String, cols: Int = 7, rows: Int = 6) {
        self.init(name: name, stringRepresentation: scale, notes: scale.scale, cols: cols, rows: rows)
    }

}

// MARK: - Chord+Shapes

public extension Chord {

    public func shapes(scale: Int = 20, strokeWidth: Int = 4) -> [Shape] {

        let colWidth = 3 * scale
        let rowHeight = 4 * scale

        let width: Int = cols * colWidth
        let height: Int = rows * rowHeight

        let radius = colWidth / 2 - strokeWidth

        let start = Point(colWidth, rowHeight * topOffset + strokeWidth / 2)
        let end = Point(width - colWidth, height)

        var shapes: [Shape] = []

        // SVG header
        shapes.append(SVG(width: width, height: height + strokeWidth))

        // Title
        if name.characters.count > 0 {
            shapes.append(Text(coord: Point(start.x + colWidth, rowHeight - radius), size: radius * 2, text: name))
        }

        // Horizontal lines
        for i in 0 ... rows - topOffset {
            shapes.append(Line(
                start: Point(start.x, start.y + rowHeight * i),
                end: Point(end.x, start.y + rowHeight * i),
                stroke: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0),
                strokeWidth: i > 0 ? strokeWidth : strokeWidth * 2
            ))
        }

        // Vertical lines
        for i in 0 ... cols - 2 {
            shapes.append(Line(
                start: Point(start.x + colWidth * i, start.y - strokeWidth),
                end: Point(start.x + colWidth * i, end.y + rowHeight / 2),
                stroke: UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0),
                strokeWidth: strokeWidth + (cols - 2 - i)
            ))
        }

        // Note dots
        for note in notes {
            shapes.append(contentsOf: note.shapes(start: start, end: end, colWidth: colWidth, rowHeight: rowHeight, radius: radius, strokeWidth: strokeWidth))
        }
        
        return shapes
    }
    
}

// MARK: - Chord+SVG

public extension Chord {

    public func svg(width: Int, strokeWidth: Int = 4) -> String {

        var lines: [String] = []

        for shape in shapes(scale: width / 7 / 3, strokeWidth: strokeWidth) {
            lines.append(shape.xml)
        }

        lines.append("</svg>")

        return lines.reduce("") { prev, new in
            prev + "\n" + new
        }
    }

    public func html(width: Int, strokeWidth: Int = 4) -> String {

        var lines: [String] = [
            "<!doctype html>",
            "<html>",
            "<head><meta name=\"viewport\" content=\"initial-scale=1.0\" /></head>",
            "<body style=\"margin: 0; padding: 0;\">",
            "<div style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);\">"
        ]

        for shape in shapes(scale: width / 7 / 3, strokeWidth: strokeWidth) {
            lines.append(shape.xml)
        }

        lines.append(contentsOf: [
            "</svg>",
            "</div>",
            "</body>",
            "</html>"
        ])

        return lines.reduce("") { prev, new in
            prev + "\n" + new
        }
    }

}
