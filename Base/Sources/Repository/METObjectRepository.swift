//
//  METObjectRepository.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/06.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public final class METObjectRepository: ObjectRepository {
    private let objectService: ObjectAPIService
    
    public init(objectService: ObjectAPIService) {
        self.objectService = objectService
    }
    
    public func load(objectId: Int, completion: @escaping LoadCompletionHandler) {
        let request = ObjectAPIRequest(objectId: objectId)
        self.objectService.fetch(request: request,
                                 completion: {
                                     switch $0 {
                                     case .success(let result):
                                         completion(.success(result))
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
