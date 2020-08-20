//
//  METDepartmentModel.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/13.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

final class METDepartmentModel: DepartmentModel {
    private let apiRepository: DepartmentRepository
    private let dbRepository: DepartmentRepository
    
    private(set) weak var output: DepartmentModelOutput?
    
    init(apiRepository: DepartmentRepository,
         dbRepository: DepartmentRepository,
         output: DepartmentModelOutput? = nil) {
        self.apiRepository = apiRepository
        self.dbRepository = dbRepository
        self.output = output
    }
    
    func load() {
        let currentDate = Date()
        let previousDate = String.to(AppSettings.lastUpdate)
        let diff = currentDate.timeIntervalSince1970 - previousDate.timeIntervalSince1970
        let useDatabase = diff < AppSettings.departmentUpdateInterval
        let targetRepository = useDatabase ? dbRepository : apiRepository
        targetRepository.load(completion: { [weak self] in
            switch $0 {
            case .success(let items):
                if !useDatabase {
                    self?.dbRepository.store(departments: items,
                                             completion: {
                                                if $0 {
                                                    AppSettings.lastUpdate = String.from(currentDate)
                                                }
                    })
                }
                self?.output?.onLoad(departments: items)
            case .failure(let error):
                NSLog("\(error)")
                self?.output?.onFailLoadindg()
            }
        })
    }
}

private extension String {
    private static var formatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return f
    }
    
    static func from(_ date: Date) -> String {
        return formatter.string(from: date)
    }
    static func to(_ string : String) -> Date {
        return formatter.date(from: string) ?? Date(timeIntervalSince1970: 0)
    }
}
