//
//  GalleryPresenter.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/24.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import UIKit
import METBase

protocol GalleryPresenterOutput {
    func requestRenderDepartments(departments: [DepartmentViewItem])
    
    func setBackgroundImage(image: UIImage?)
}

protocol GalleryPresenter {
    var output: GalleryPresenterOutput? { get set }
}
