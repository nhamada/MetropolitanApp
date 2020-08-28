//
//  GalleryInteractor.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/23.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

protocol GalleryInteractorOutput: class {
    func onLoadDepartments(departments: [METDepartment])
    func onFailLoadingDepartments()
}

protocol GalleryInteractor {
    var departmentModel: DepartmentModel { get }
    var output: GalleryInteractorOutput? { get set }
    
    func loadDepartments()
}
