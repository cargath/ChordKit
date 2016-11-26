//
//  String+Parser.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public extension String {

    var color: UIColor {
        switch self {
            case "r", "R":
                return .red
            case "b", "B":
                return .blue
            default:
                return .black
        }
    }

    var note: Note? {

        guard let string = Int(self[0]) else {
            return nil
        }

        guard let fret = Int(self[1]) else {
            return Note(fret: -1, string: string, color: self[1].color)
        }

        return Note(fret: fret, string: string, color: self[2].color)
    }

    var chord: [Note] {

        if self.characters.count != 6 {
            return []
        }

        var notes: [Note] = []

        for i in 0 ..< 6 {

            if let fret = Int(self[i]) {
                notes.append(Note(fret: fret, string: i, color: .black))
            }

            if self[i] == "x" || self[i] == "X" {
                notes.append(Note(fret: -1, string: i, color: .black))
            }
        }

        return notes
    }

    var scale: [Note] {
        return self.components(separatedBy: "-").flatMap { component in
            component.note
        }
    }
    
}
