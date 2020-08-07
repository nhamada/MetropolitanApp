//
//  DepartmentsAPIRequest.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

internal typealias DepartmentsAPIService = METNetworkService<DepartmentsAPIRequest, DepartmentsAPIResponse>

internal final class DepartmentsAPIRequestParameter: RequestParameter {
}

internal final class DepartmentsAPIRequest: Request {
    internal typealias Parameter = DepartmentsAPIRequestParameter
    
    internal let parameter: Parameter? = nil
    
    internal var scheme: String {
        "https"
    }
    
    internal var hostname: String {
        "collectionapi.metmuseum.org"
    }
    
    internal var path: String {
        "/public/collection/v1/departments"
    }
    
    internal var method: HTTPRequestMethod {
        .get
    }
    
    internal init() {
    }
}
