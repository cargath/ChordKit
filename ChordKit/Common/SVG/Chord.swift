//
//  Chord.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public class Chord: Node {

    public init(name: String = "", width: Int = Config.width, height: Int = Config.height, notes: [Note]) {

        let start = Point(Config.colWidth, Config.rowHeight)
        let end = Point(width - Config.colWidth, height)

        let text: [Node] = [
            Text(coord: Point(start.x + Config.colWidth, start.y - Config.radius), text: name)
        ]

        let horizontalLines: [Node] = (0 ... Config.rows - 2).map {
            return Line(start: Point(start.x, start.y + Config.rowHeight + Config.rowHeight * $0), end: Point(end.x, start.y + Config.rowHeight + Config.rowHeight * $0))
        }

        let verticalLines: [Node] = (0 ... Config.cols - 2).map {
            return Line(start: Point(start.x + Config.colWidth * $0, start.y + Config.rowHeight - Config.strokeWidth / 2), end: Point(start.x + Config.colWidth * $0, end.y + Config.rowHeight - Config.strokeWidth / 2))
        }

        let circles: [Node] = notes.enumerated().map { index, note in

            let string = (note.string != nil) ? note.string! - 1 : index

            if string > 6 {
                return nil
            }

            if (note.fret < 0) {
                return Cross(center: Point(start.x + string * Config.colWidth, start.y + Config.rowHeight / 2))
            }

            if (note.fret == 0) {
                return Circle(stroke: note.color, center: Point(start.x + string * Config.colWidth, start.y + Config.rowHeight / 2))
            }

            return Circle(fill: note.color, center: Point(start.x + string * Config.colWidth, start.y + Config.rowHeight / 2 + note.fret * Config.rowHeight))

        }.flatMap {
            return $0
        }
        
        super.init(children: [text, horizontalLines, verticalLines, circles].flatMap({$0}))
    }
    
}
