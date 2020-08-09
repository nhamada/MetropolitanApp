//
//  RepositoryBuilder.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/09.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public enum METRepository {
    public enum Builder {
        public static func buildObjectRepository(configuration: URLSessionConfiguration) -> ObjectRepository {
            let service = ObjectAPIService(configuration: configuration)
            return METObjectRepository(objectService: service)
        }
        
        public static func buildObjectIDsRepository(configuration: URLSessionConfiguration) -> ObjectIDListRepository {
            let objectIdService = ObjectIDsAPIService(configuration: configuration)
            let searchService = SearchAPIService(configuration: configuration)
            return METObjectIDListRepository(objectIdService: objectIdService,
                                             searchService: searchService)
        }
        
        public static func buildDepartmentRepository(configuration: URLSessionConfiguration) -> DepartmentRepository {
            let service = DepartmentsAPIService(configuration: configuration)
            return METDepartmentRepository(apiService: service)
        }
    }
}
