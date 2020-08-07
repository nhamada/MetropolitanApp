//
//  ObjectIDListRepository.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/06.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public enum ObjectIDListLoadError: Error {
    case unrecoverableNetworkError
    case recoverableNetworkError
}

public protocol ObjectIDListRepository {
    typealias LoadIDListCompletionHandler = (Result<[METObjectID], ObjectIDListLoadError>) -> Void
    
    func loadObjectIDs(departmentId: METDepartmentID, completion: @escaping LoadIDListCompletionHandler)
    func loadObjectIDs(departmentIds: [METDepartmentID], completion: @escaping LoadIDListCompletionHandler)
    
    func search(query: String, completion: @escaping LoadIDListCompletionHandler)
}
