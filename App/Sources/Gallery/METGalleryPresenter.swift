//
//  METGalleryPresenter.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/24.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

final class METGalleryPresenter: GalleryPresenter, GalleryInteractorOutput {
    var output: GalleryPresenterOutput?
    
    init(output: GalleryPresenterOutput? = nil) {
        self.output = output
    }
    
    func onLoadDepartments(departments: [METDepartment]) {
        output?.requestRenderDepartments(departments: departments.map( {
            DepartmentViewItem(from: $0)
            }).sorted(by: {
                $0.id < $1.id
            }))
    }
    
    func onFailLoadingDepartments() {
        // TODO: Error handling
    }
}
