//
//  ObjectAPIRequest.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public typealias ObjectAPIService = METNetworkService<ObjectAPIRequest, ObjectAPIResponse>

public final class ObjectAPIRequestParameter: RequestParameter {
}

public final class ObjectAPIRequest: Request {
    public typealias Parameter = ObjectAPIRequestParameter
    
    public let parameter: Parameter? = nil
    
    public var scheme: String {
        "https"
    }
    
    public var hostname: String {
        "collectionapi.metmuseum.org"
    }
    
    public var path: String {
        "/public/collection/v1/objects/\(objectId)"
    }
    
    public var method: HTTPRequestMethod {
        .get
    }
    
    private let objectId: Int
    
    public init(objectId: Int) {
        self.objectId = objectId
    }
}
