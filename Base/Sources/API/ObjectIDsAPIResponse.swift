//
//  ObjectIDsAPIResponse.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

internal struct ObjectIDsAPIResponse: Response {
    internal typealias ResponseDecoder = JSONDecoder
    
    internal static var decoder: ResponseDecoder {
        JSONDecoder()
    }
    
    private enum CodingKey: String, Swift.CodingKey {
        case total = "total"
        case objectIDs = "objectIDs"
    }
    
    internal let total: Int
    internal let objectIDs: [Int]
    
    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.total = try container.decode(Int.self, forKey: .total)
        self.objectIDs = (try? container.decode([Int].self, forKey: .objectIDs)) ?? []
    }
}
