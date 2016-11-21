//
//  UInt+Indentation.swift
//  ChordKit
//
//  Created by Carsten Könemann on 21/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

public extension UInt {

    public var indentation: String {
        return (0 ... self).map({$0 > 0 ? "    " : ""}).reduce("", +)
    }

}
