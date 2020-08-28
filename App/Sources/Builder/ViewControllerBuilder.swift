//
//  ViewControllerBuilder.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/23.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

enum AppBuilder {
}

extension AppBuilder {
    static func buildGallery(_ viewController: GalleryViewController) {
        let departmentModel = AppBuilder.buildDepartmentModel()
        var interactor = AppBuilder.buildGalleryInteractor(departmentModel: departmentModel)
        var presenter = AppBuilder.buildGalleryPresenter()
        
        interactor.output = presenter as? GalleryInteractorOutput
        presenter.output = viewController as? GalleryPresenterOutput
        
        viewController.interactor = interactor
    }
}
