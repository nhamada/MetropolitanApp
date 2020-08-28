//
//  DepartmentViewItem.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/25.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

struct DepartmentViewItem {
    let id: METDepartmentID
    let name: String
    
    init(from value: METDepartment) {
        self.id = value.id
        self.name = value.displayName
    }
}
