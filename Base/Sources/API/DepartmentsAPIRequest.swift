//
//  DepartmentsAPIRequest.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public typealias DepartmentsAPIService = METNetworkService<DepartmentsAPIRequest, DepartmentsAPIResponse>

public final class DepartmentsAPIRequestParameter: RequestParameter {
    public var queryItems: [URLQueryItem]? {
        nil
    }
    
    public var body: Data? {
        nil
    }
}

public final class DepartmentsAPIRequest: Request {
    public typealias Parameter = DepartmentsAPIRequestParameter
    
    public let parameter: Parameter? = nil
    
    public var scheme: String {
        "https"
    }
    
    public var hostname: String {
        "collectionapi.metmuseum.org"
    }
    
    public var path: String {
        "/public/collection/v1/departments"
    }
    
    public var method: HTTPRequestMethod {
        .get
    }
    
    public init() {
    }
}
