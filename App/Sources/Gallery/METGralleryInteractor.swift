//
//  METGralleryInteractor.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/23.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

final class METGalleryInteractor: GalleryInteractor, DepartmentModelOutput {
    var departmentModel: DepartmentModel
    var output: GalleryInteractorOutput?
    
    init(departmentModel: DepartmentModel,
         output: GalleryInteractorOutput? = nil) {
        self.departmentModel = departmentModel
        self.output = output
        
        self.departmentModel.output = self
    }
    
    func loadDepartments() {
        departmentModel.load()
    }
    
    func onLoad(departments: [METDepartment]) {
        output?.onLoadDepartments(departments: departments)
    }
    
    func onFailLoading() {
        output?.onFailLoadingDepartments()
    }
}
