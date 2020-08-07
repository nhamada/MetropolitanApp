//
//  Request.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/03.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

internal enum HTTPRequestMethod {
    case get
    case head
    case post
    case put
    case delete
    
    internal var stringValue: String {
        switch self {
        case .get:
            return "GET"
        case .head:
            return "HEAD"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}

internal protocol RequestParameter {
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}

internal extension RequestParameter {
    var queryItems: [URLQueryItem]? { nil }
    var body: Data? { nil }
}

internal protocol Request {
    associatedtype Parameter: RequestParameter
    
    var parameter: Parameter? { get }
    
    var scheme: String { get }
    var hostname: String { get }
    var path: String { get }
    
    var method: HTTPRequestMethod { get }
    
    func make() -> URLRequest
}

internal extension Request {
    func make() -> URLRequest {
        var component = URLComponents()
        
        component.scheme = scheme
        component.host = hostname
        component.path = path
        component.queryItems = parameter?.queryItems
        
        guard let url = component.url else {
            fatalError("Invalid URL to request \(type(of: self))")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.stringValue
        request.httpBody = parameter?.body
        return request
    }
}
