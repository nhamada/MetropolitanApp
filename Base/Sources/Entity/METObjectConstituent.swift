//
//  METObjectConstituent.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/07.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public struct METObjectConstituent {
    public let role: String
    public let name: String
    public let constituentULAN: URL
    public let constituentWikidata: URL
    public let gender: String
    
    internal init(from constituent: Constituent) {
        self.role = constituent.role
        self.name = constituent.name
        self.constituentULAN = constituent.constituentULAN
        self.constituentWikidata = constituent.constituentWikidata
        self.gender = constituent.gender
    }
}
