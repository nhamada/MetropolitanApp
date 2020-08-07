//
//  ObjectIDsAPIRequest.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

internal typealias ObjectIDsAPIService = METNetworkService<ObjectIDsAPIRequest, ObjectIDsAPIResponse>

internal final class ObjectIDsAPIRequestParameter: RequestParameter {
    internal var queryItems: [URLQueryItem]? {
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
    
    private let metadataDate: Date?
    private let departmentIds: [Int]
    
    internal init(metadataDate: Date? = nil,
                  departmentIds: [Int] = []) {
        self.metadataDate = metadataDate
        self.departmentIds = departmentIds
    }
}

internal final class ObjectIDsAPIRequest: Request {
    internal typealias Parameter = ObjectIDsAPIRequestParameter
    
    internal let parameter: Parameter?
    
    internal var scheme: String {
        "https"
    }
    
    internal var hostname: String {
        "collectionapi.metmuseum.org"
    }
    
    internal var path: String {
        "/public/collection/v1/objects"
    }
    
    internal var method: HTTPRequestMethod {
        .get
    }
    
    internal init(parameter: Parameter? = nil) {
        self.parameter = parameter
    }
}
