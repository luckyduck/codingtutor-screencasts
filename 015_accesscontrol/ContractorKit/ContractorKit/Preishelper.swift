//
//  Preishelper.swift
//  ContractorKit
//
//  Created by Jan Brinkmann on 12/02/16.
//  Copyright © 2016 Jan Brinkmann. All rights reserved.
//

import Foundation

public class Preishelper {
    public init() {
        
    }
    
    public func getVK() -> Double {
        return getEK() * 1.5
    }
    
    func getEK() -> Double {
        return 12.34
    }
}