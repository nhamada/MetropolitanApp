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
    typealias LoadCompletionHandler = (Result<[METDepartment], DepartmentLoadError>) -> Void
    typealias StoreCompletionHandler = (Bool) -> Void
    
    func load(completion: @escaping LoadCompletionHandler)
    
    func clear()
    
    func store(departments: [METDepartment], completion: StoreCompletionHandler)
}

extension DepartmentRepository {
    func clear() {
        fatalError("Unimplemented: \(#function)")
    }
    
    func store(departments: [METDepartment], completion: StoreCompletionHandler) {
        fatalError("Unimplemented: \(#function)")
    }
}
