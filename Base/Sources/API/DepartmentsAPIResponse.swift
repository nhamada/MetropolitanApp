//
//  DepartmentsAPIResponse.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public struct DepartmentsAPIResponse: Response {
    public typealias ResponseDecoder = JSONDecoder
    
    public static var decoder: ResponseDecoder {
        JSONDecoder()
    }
    
    private enum CodingKey: String, Swift.CodingKey {
        case departments = "departments"
    }
    
    public let departments: [Department]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.departments = (try? container.decode([Department].self, forKey: .departments)) ?? []
    }
}

public struct Department: Decodable {
    private enum CodingKey: String, Swift.CodingKey {
        case id = "departmentId"
        case displayName = "displayName"
    }
    
    public let id: Int
    public let displayName: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.displayName = try container.decode(String.self, forKey: .displayName)
    }
}
