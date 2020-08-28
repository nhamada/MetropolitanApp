//
//  ModelBuilder.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/20.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

extension AppBuilder {
    static func buildDepartmentModel(output: DepartmentModelOutput? = nil) -> DepartmentModel {
        let apiRepository = METRepository.Builder.buildDepartmentRepository(configuration: .ephemeral)
        let dbRepository = METRepository.Builder.buildDepartmentRepository()
        return METDepartmentModel(apiRepository: apiRepository,
                                  dbRepository: dbRepository,
                                  output: output)
    }
}
