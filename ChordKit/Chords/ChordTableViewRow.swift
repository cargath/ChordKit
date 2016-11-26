//
//  ChordTableViewRow.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import ChordKit

enum ChordRepresentation {

    case Chord(stringRepresentation: String)
    case Scale(stringRepresentation: String)

}

extension ChordRepresentation {

    var chord: Chord {
        switch self {
            case .Chord(let stringRepresentation):
                return ChordKit.Chord(chord: stringRepresentation)
            case .Scale(let stringRepresentation):
                return ChordKit.Chord(scale: stringRepresentation)
        }
    }

}

struct ChordTableViewRow {

    let title: String?
    let chord: ChordRepresentation?

}

extension ChordTableViewRow: JSONObjectConvertible {

    public init?(JSONObject: JSONObject) {

        self.title = JSONObject["title"] as? String

        if let chord = JSONObject["chord"] as? String {
            self.chord = .Chord(stringRepresentation: chord)
        } else if let scale = JSONObject["scale"] as? String {
            self.chord = .Scale(stringRepresentation: scale)
        } else {
            self.chord = nil
        }
    }

}
