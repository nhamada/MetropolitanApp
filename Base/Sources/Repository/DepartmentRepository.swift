//
//  DepartmentRepository.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/06.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public enum DepartmentLoadError: Error {
    case unrecoverableNetworkError
    case recoverableNetworkError
}

public protocol DepartmentRepository {
    typealias LoadCompletionHandler = (Result<[Department], DepartmentLoadError>) -> Void
    
    func load(completion: @escaping LoadCompletionHandler)
}
