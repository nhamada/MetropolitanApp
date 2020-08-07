//
//  Response.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/03.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import Combine

internal protocol Response: Decodable {
    associatedtype ResponseDecoder: TopLevelDecoder
    
    static var decoder: ResponseDecoder { get }
}
