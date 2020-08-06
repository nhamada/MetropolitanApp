//
//  METObjectIDListRepository.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/06.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation


public final class METObjectIDListRepository: ObjectIDListRepository {
    private let objectIdService: ObjectIDsAPIService
    private let searchService: SearchAPIService
    
    public init(objectIdService: ObjectIDsAPIService,
                searchService: SearchAPIService) {
        self.objectIdService = objectIdService
        self.searchService = searchService
    }
    
    public func loadObjectIDs(departmentId: Int, completion: @escaping LoadIDListCompletionHandler) {
        loadObjectIDs(departmentIds: [departmentId], completion: completion)
    }
    
    public func loadObjectIDs(departmentIds: [Int], completion: @escaping LoadIDListCompletionHandler) {
        let parameter = ObjectIDsAPIRequestParameter(metadataDate: nil,
                                                     departmentIds: departmentIds)
        let request = ObjectIDsAPIRequest(parameter: parameter)
        self.objectIdService.fetch(request: request,
                                   completion: {
                                    switch $0 {
                                    case .success(let result):
                                        completion(.success(result.objectIDs))
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
    
    public func search(query: String, completion: @escaping LoadIDListCompletionHandler) {
        let parameter = SearchAPIRequestParameter(query: query,
                                                  isHighlight: nil,
                                                  departmentId: nil,
                                                  isOnView: nil,
                                                  artistOrCulture: nil,
                                                  mediums: nil,
                                                  hasImages: nil,
                                                  geoLocations: nil,
                                                  dateRange: nil)
        let request = SearchAPIRequest(parameter: parameter)
        self.searchService.fetch(request: request,
                                 completion: {
                                     switch $0 {
                                     case .success(let result):
                                         completion(.success(result.objectIDs))
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
