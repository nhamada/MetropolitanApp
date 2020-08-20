//
//  DepartmentModel.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/13.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

protocol DepartmentModelOutput: class {
    func onLoad(departments: [METDepartment])
    func onFailLoadindg()
}

protocol DepartmentModel {
    var output: DepartmentModelOutput? { get }
    
    func load()
}
