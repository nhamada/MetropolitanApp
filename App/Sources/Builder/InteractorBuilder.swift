//
//  InteractorBuilder.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/24.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

extension AppBuilder {
    static func buildGalleryInteractor(departmentModel: DepartmentModel) -> GalleryInteractor {
        let interactor = METGalleryInteractor(departmentModel: departmentModel,
                                              output: nil)
        return interactor
    }
}
