//
//  ObjectAPIRequest.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

internal typealias ObjectAPIService = METNetworkService<ObjectAPIRequest, ObjectAPIResponse>

internal final class ObjectAPIRequestParameter: RequestParameter {
}

internal final class ObjectAPIRequest: Request {
    internal typealias Parameter = ObjectAPIRequestParameter
    
    internal let parameter: Parameter? = nil
    
    internal var scheme: String {
        "https"
    }
    
    internal var hostname: String {
        "collectionapi.metmuseum.org"
    }
    
    internal var path: String {
        "/public/collection/v1/objects/\(objectId)"
    }
    
    internal var method: HTTPRequestMethod {
        .get
    }
    
    private let objectId: Int
    
    internal init(objectId: Int) {
        self.objectId = objectId
    }
}
