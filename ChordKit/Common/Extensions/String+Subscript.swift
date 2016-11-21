//
//  String+Subscript.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public extension String {

    public subscript(i: Int) -> String {

        guard i >= 0 && i < characters.count else {
            return ""
        }

        return String(self[index(startIndex, offsetBy: i)])
    }
    
}
