//
//  ChordTableViewSection.swift
//  ChordKit
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

struct ChordTableViewSection {

    let title: String?
    let rows: [ChordTableViewRow]
    
}

extension ChordTableViewSection: JSONObjectConvertible {

    public init?(JSONObject: JSONObject) {
        self.title = JSONObject["title"] as? String
        self.rows = ChordTableViewRow.from(JSONArray: JSONObject["rows"] as? JSONArray)
    }

}
