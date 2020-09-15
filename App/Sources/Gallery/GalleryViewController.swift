//
//  GalleryViewController.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/23.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import UIKit
import MuseumUI

final class GalleryViewController: UIViewController, GalleryPresenterOutput {
    
    var interactor: GalleryInteractor!
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    private let progressView: FullscreenProgressView = FullscreenProgressView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppBuilder.buildGallery(self)
        
        self.view.addSubview(progressView)
        interactor.loadDepartments()
    }
    
    // MARK:- GalleryPresenterOutput
    func requestRenderDepartments(departments: [DepartmentViewItem]) {
        departments.forEach {
            NSLog("\($0)")
        }
        interactor.loadRandomObject(departmentIDList: departments.map {
            $0.id
        })
    }
    
    func setBackgroundImage(image: UIImage?) {
        if Thread.isMainThread {
            progressView.removeFromSuperview()
            backgroundImageView.image = image
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.progressView.removeFromSuperview()
                self?.backgroundImageView.image = image
            }
        }
    }
}
