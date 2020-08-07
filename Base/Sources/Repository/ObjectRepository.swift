//
//  ObjectRepository.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/06.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public enum ObjectLoadError: Error {
    case unrecoverableNetworkError
    case recoverableNetworkError
}

public protocol ObjectRepository {
    typealias LoadCompletionHandler = (Result<METObject, ObjectLoadError>) -> Void
    
    func load(objectId: Int, completion: @escaping LoadCompletionHandler)
}
