//
//  GalleryPresenter.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/24.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

protocol GalleryPresenterOutput {
    func requestRenderDepartments(departments: [DepartmentViewItem])
}

protocol GalleryPresenter {
    var output: GalleryPresenterOutput? { get set }
}
