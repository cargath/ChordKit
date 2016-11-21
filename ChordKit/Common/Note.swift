//
//  Note.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public struct Note {

    public var fret: Int
    public var string: Int?
    public var color: Color

    public init(fret: Int = -1, string: Int? = nil, color: Color = .black) {
        self.fret = fret
        self.string = string
        self.color = color
    }
    
}
