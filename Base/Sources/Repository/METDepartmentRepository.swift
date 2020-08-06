//
//  METDepartmentRepository.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/06.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public final class METDepartmentRepository: DepartmentRepository {
    
    private let apiService: DepartmentsAPIService
    
    public init(apiService: DepartmentsAPIService) {
        self.apiService = apiService
    }
    
    public func load(completion: @escaping LoadCompletionHandler) {
        let request = DepartmentsAPIRequest()
        self.apiService.fetch(request: request,
                              completion: {
                                switch $0 {
                                case .success(let result):
                                    completion(.success(result.departments))
                                case .failure(let error):
                                    switch error {
                                    case .invalidResponse:
                                        completion(.failure(.recoverableNetworkError))
                                    case .noData:
                                        completion(.failure(.unrecoverableNetworkError))
                                    case .httpConnectionError:
                                        completion(.failure(.recoverableNetworkError))
                                    case .decodingFailure:
                                        completion(.failure(.recoverableNetworkError))
                                    }
                                }
        })
    }
}
