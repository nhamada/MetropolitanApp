//
//  ObjectIDsAPIRequest.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public typealias ObjectIDsAPIService = METNetworkService<ObjectIDsAPIRequest, ObjectIDsAPIResponse>

public final class ObjectIDsAPIRequestParameter: RequestParameter {
    public var queryItems: [URLQueryItem]? {
        var items: [URLQueryItem] = []
        
        if !departmentIds.isEmpty {
            let ids = departmentIds.reduce("") {
                $0.isEmpty ? "\($1)" : "\($0)|\($1)"
            }
            items.append(URLQueryItem(name: "departmentIds",
                                      value: ids))
        }
        
        return items
    }
    
    public var body: Data? {
        nil
    }
    
    private let metadataDate: Date?
    private let departmentIds: [Int]
    
    public init(metadataDate: Date? = nil,
                departmentIds: [Int] = []) {
        self.metadataDate = metadataDate
        self.departmentIds = departmentIds
    }
}

public final class ObjectIDsAPIRequest: Request {
    public typealias Parameter = ObjectIDsAPIRequestParameter
    
    public let parameter: Parameter?
    
    public var scheme: String {
        "https"
    }
    
    public var hostname: String {
        "collectionapi.metmuseum.org"
    }
    
    public var path: String {
        "/public/collection/v1/objects"
    }
    
    public var method: HTTPRequestMethod {
        .get
    }
    
    public init(parameter: Parameter? = nil) {
        self.parameter = parameter
    }
}
