//
//  GalleryViewController.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/23.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import UIKit

final class GalleryViewController: UIViewController, GalleryPresenterOutput {
    
    var interactor: GalleryInteractor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppBuilder.buildGallery(self)
        
        interactor.loadDepartments()
    }
    
    // MARK:- GalleryPresenterOutput
    func requestRenderDepartments(departments: [DepartmentViewItem]) {
        departments.forEach {
            NSLog("\($0)")
        }
    }
}
