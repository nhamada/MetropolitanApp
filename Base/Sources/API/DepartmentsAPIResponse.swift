//
//  DepartmentsAPIResponse.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

internal struct DepartmentsAPIResponse: Response {
    internal typealias ResponseDecoder = JSONDecoder
    
    internal static var decoder: ResponseDecoder {
        JSONDecoder()
    }
    
    private enum CodingKey: String, Swift.CodingKey {
        case departments = "departments"
    }
    
    internal let departments: [Department]
    
    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.departments = (try? container.decode([Department].self, forKey: .departments)) ?? []
    }
}

internal struct Department: Decodable {
    private enum CodingKey: String, Swift.CodingKey {
        case id = "departmentId"
        case displayName = "displayName"
    }
    
    internal let id: Int
    internal let displayName: String
    
    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.displayName = try container.decode(String.self, forKey: .displayName)
    }
}
