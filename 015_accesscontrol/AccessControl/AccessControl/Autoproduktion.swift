//
//  Autoproduktion.swift
//  AccessControl
//
//  Created by Jan Brinkmann on 12/02/16.
//  Copyright © 2016 Jan Brinkmann. All rights reserved.
//

import Foundation

struct Auto {
    var name: String
    private var id: Int
    
    func getId() -> Int {
        return id
    }
}

struct Autofabrik {
    func newPorsche() -> Auto {
        var auto = Auto(name: "Porsche", id: 1)
        auto.id = 23
        
        return auto
    }
}