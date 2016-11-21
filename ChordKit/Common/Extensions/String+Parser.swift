//
//  String+Parser.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

// MARK: - String+Color

public extension String {

    public var color: Color {
        switch self {
        case "r":
            return .red
        case "b":
            return .blue
        default:
            return .black
        }
    }

}

// MARK: - String+Note

public extension String {

    public var note: Note {

        if let fret = Int(self[0]) {

            if let string = Int(self[1]) {
                return Note(fret: fret, string: string, color: self[2].color)
            }

            return Note(fret: fret, color: self[1].color)
        }

        return Note()
    }

    public var notes: [Note] {
        return self.components(separatedBy: "-").map({$0.note})
    }
    
}

// MARK: - String+Chord

public extension String {

    public var chord: Chord {
        var components: [String] = self.components(separatedBy: "-")
        let name = components[0]
        components.removeFirst()

        return Chord(name: name, notes: components.map({$0.note}))
    }

}
