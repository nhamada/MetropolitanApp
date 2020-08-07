//
//  METObjectTag.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/07.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public struct METObjectTag {
    public let term: String
    public let AAT: URL
    
    internal init(from tag: ObjectTag) {
        self.term = tag.term
        self.AAT = tag.AAT
    }
}
