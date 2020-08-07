//
//  SearchAPIRequest.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

internal typealias SearchAPIService = METNetworkService<SearchAPIRequest, SearchAPIResponse>

internal final class SearchAPIRequestParameter: RequestParameter {
    internal var queryItems: [URLQueryItem]? {
        var items: [URLQueryItem] = [URLQueryItem(name: "q",
                                                  value: query)]
        
        if let isHighlight = isHighlight {
            items.append(URLQueryItem(name: "isHighlight",
                                      value: "\(isHighlight)"))
        }
        if let departmentId = departmentId {
            items.append(URLQueryItem(name: "departmentId",
                                      value: "\(departmentId)"))
        }
        if let isOnView = isOnView {
            items.append(URLQueryItem(name: "isOnView",
                                      value: "\(isOnView)"))
        }
        if let artistOrCulture = artistOrCulture {
            items.append(URLQueryItem(name: "artistOrCulture",
                                      value: "\(artistOrCulture)"))
        }
        if let mediums = mediums {
            let mid = mediums.reduce("") {
                $0.isEmpty ? "\($1)" : "\($0)|\($1)"
            }
            items.append(URLQueryItem(name: "medium",
                                      value: mid))
        }
        if let hasImages = hasImages {
            items.append(URLQueryItem(name: "hasImages",
                                      value: "\(hasImages)"))
        }
        if let geoLocations = geoLocations {
            let locations = geoLocations.reduce("") {
                $0.isEmpty ? "\($1)" : "\($0)|\($1)"
            }
            items.append(URLQueryItem(name: "geoLocations",
                                      value: locations))
        }
        if let dateRange = dateRange {
            items.append(URLQueryItem(name: "dateBegin",
                                      value: "\(dateRange.lowerBound)"))
            items.append(URLQueryItem(name: "dateEnd",
                                      value: "\(dateRange.upperBound)"))
        }
        
        return items
    }
    
    private let query: String
    private let isHighlight: Bool?
    private let departmentId: Int?
    private let isOnView: Bool?
    private let artistOrCulture: Bool?
    private let mediums: [String]?
    private let hasImages: Bool?
    private let geoLocations: [String]?
    private let dateRange: Range<Int>?
    
    internal init(query: String,
                  isHighlight: Bool? = nil,
                  departmentId: Int? = nil,
                  isOnView: Bool? = nil,
                  artistOrCulture: Bool? = nil,
                  mediums: [String]? = nil,
                  hasImages: Bool? = nil,
                  geoLocations: [String]? = nil,
                  dateRange: Range<Int>? = nil) {
        self.query = query
        self.isHighlight = isHighlight
        self.departmentId = departmentId
        self.isOnView = isOnView
        self.artistOrCulture = artistOrCulture
        self.mediums = mediums
        self.hasImages = hasImages
        self.geoLocations = geoLocations
        self.dateRange = dateRange
    }
}

internal final class SearchAPIRequest: Request {
    internal typealias Parameter = SearchAPIRequestParameter
    
    internal let parameter: Parameter?
    
    internal var scheme: String {
        "https"
    }
    
    internal var hostname: String {
        "collectionapi.metmuseum.org"
    }
    
    internal var path: String {
        "/public/collection/v1/search"
    }
    
    internal var method: HTTPRequestMethod {
        .get
    }
    
    internal init(parameter: Parameter? = nil) {
        self.parameter = parameter
    }
}
