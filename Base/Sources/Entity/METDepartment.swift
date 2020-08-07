//
//  METDepartment.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/07.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public typealias METDepartmentID = Int

public struct METDepartment {
    public let id: METDepartmentID
    public let displayName: String
    
    internal init(from department: Department) {
        self.id = department.id
        self.displayName = department.displayName
    }
}
