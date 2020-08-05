//
//  ObjectAPIResponse.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public struct ObjectAPIResponse: Response {
    public typealias ResponseDecoder = JSONDecoder
    
    public static var decoder: ResponseDecoder {
        JSONDecoder()
    }
    
    private enum CodingKey: String, Swift.CodingKey {
        case objectID = "objectID"
        case isHighlight = "isHighlight"
        case accessionNumber = "accessionNumber"
        case accessionYear = "accessionYear"
        case isPublicDomain = "isPublicDomain"
        case primaryImage = "primaryImage"
        case primaryImageSmall = "primaryImageSmall"
        case additionalImages = "additionalImages"
        case constituents = "constituents"
        case department = "department"
        case objectName = "objectName"
        case title = "title"
        case culture = "culture"
        case period = "period"
        case dynasty = "dynasty"
        case reign = "reign"
        case portfolio = "portfolio"
        case artistRole = "artistRole"
        case artistPrefix = "artistPrefix"
        case artistDisplayName = "artistDisplayName"
        case artistDisplayBio = "artistDisplayBio"
        case artistSuffix = "artistSuffix"
        case artistAlphaSort = "artistAlphaSort"
        case artistNationality = "artistNationality"
        case artistBeginDate = "artistBeginDate"
        case artistEndDate = "artistEndDate"
        case artistGender = "artistGender"
        case artistWikidata = "artistWikidata_URL"
        case artistULAN = "artistULAN_URL"
        case objectDate = "objectDate"
        case objectBeginDate = "objectBeginDate"
        case objectEndDate = "objectEndDate"
        case medium = "medium"
        case dimensions = "dimensions"
        case creditLine = "creditLine"
        case geographyType = "geographyType"
        case city = "city"
        case state = "state"
        case county = "county"
        case country = "country"
        case region = "region"
        case subregion = "subregion"
        case locale = "locale"
        case locus = "locus"
        case excavation = "excavation"
        case river = "river"
        case classification = "classification"
        case rightsAndReproduction = "rightsAndReproduction"
        case linkResource = "linkResource"
        case metadataDate = "metadataDate"
        case repository = "repository"
        case objectURL = "objectURL"
        case tags = "tags"
        case objectWikidata = "objectWikidata_URL"
        case isTimelineWork = "isTimelineWork"
    }
    
    public let objectId: Int
    public let isHighlight: Bool
    public let accessionNumber: String
    public let accessionYear: String
    public let isPublicDomain: Bool
    public let primaryImageURL: URL
    public let primaryImageSmallURL: URL
    public let additionalImageURLs: [URL]
    public let constituents: [Constituent]
    public let department: String
    public let objectName: String
    public let title: String
    public let culture: String
    public let period: String
    public let dynasty: String
    public let reign: String
    public let portfolio: String
    public let artistRole: String
    public let artistPrefix: String
    public let artistDisplayName: String
    public let artistDisplayBio: String
    public let artistSuffix: String
    public let artistAlphaSort: String
    public let artistNationality: String
    public let artistBeginDate: String
    public let artistEndDate: String
    public let artistGender: String
    public let artistWikidata: URL
    public let artistULAN: URL
    public let objectDate: String
    public let objectBeginDate: Int
    public let objectEndDate: Int
    public let medium: String
    public let dimensions: String
    public let creditLine: String
    public let geographyType: String
    public let city: String
    public let state: String
    public let county: String
    public let country: String
    public let region: String
    public let subregion: String
    public let locale: String
    public let locus: String
    public let excavation: String
    public let river: String
    public let classification: String
    public let rightsAndReproduction: String
    public let linkResource: URL?
    public let metadataDate: Date
    public let repository: String
    public let objectURL: URL?
    public let tags: [ObjectTag]
    public let objectWikidata: URL?
    public let isTimelineWork: Bool
    
    public init(from decoder: Decoder) throws {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions.insert(.withFractionalSeconds)
        
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.objectId = try container.decode(Int.self, forKey: .objectID)
        self.isHighlight = try container.decode(Bool.self, forKey: .isHighlight)
        self.accessionNumber = try container.decode(String.self, forKey: .accessionNumber)
        self.accessionYear = try container.decode(String.self, forKey: .accessionYear)
        self.isPublicDomain = try container.decode(Bool.self, forKey: .isPublicDomain)
        self.primaryImageURL = try container.decode(URL.self, forKey: .primaryImage)
        self.primaryImageSmallURL = try container.decode(URL.self, forKey: .primaryImageSmall)
        self.additionalImageURLs = try container.decode([URL].self, forKey: .additionalImages)
        self.constituents = try container.decode([Constituent].self, forKey: .constituents)
        self.department = try container.decode(String.self, forKey: .department)
        self.objectName = try container.decode(String.self, forKey: .objectName)
        self.title = try container.decode(String.self, forKey: .title)
        self.culture = try container.decode(String.self, forKey: .culture)
        self.period = try container.decode(String.self, forKey: .period)
        self.dynasty = try container.decode(String.self, forKey: .dynasty)
        self.reign = try container.decode(String.self, forKey: .reign)
        self.portfolio = try container.decode(String.self, forKey: .portfolio)
        self.artistRole = try container.decode(String.self, forKey: .artistRole)
        self.artistPrefix = try container.decode(String.self, forKey: .artistPrefix)
        self.artistDisplayName = try container.decode(String.self, forKey: .artistDisplayName)
        self.artistDisplayBio = try container.decode(String.self, forKey: .artistDisplayBio)
        self.artistSuffix = try container.decode(String.self, forKey: .artistSuffix)
        self.artistAlphaSort = try container.decode(String.self, forKey: .artistAlphaSort)
        self.artistNationality = try container.decode(String.self, forKey: .artistNationality)
        self.artistBeginDate = try container.decode(String.self, forKey: .artistBeginDate)
        self.artistEndDate = try container.decode(String.self, forKey: .artistEndDate)
        self.artistGender = try container.decode(String.self, forKey: .artistGender)
        self.artistWikidata = try container.decode(URL.self, forKey: .artistWikidata)
        self.artistULAN = try container.decode(URL.self, forKey: .artistULAN)
        self.objectDate = try container.decode(String.self, forKey: .objectDate)
        self.objectBeginDate = try container.decode(Int.self, forKey: .objectBeginDate)
        self.objectEndDate = try container.decode(Int.self, forKey: .objectEndDate)
        self.medium = try container.decode(String.self, forKey: .medium)
        self.dimensions = try container.decode(String.self, forKey: .dimensions)
        self.creditLine = try container.decode(String.self, forKey: .creditLine)
        self.geographyType = try container.decode(String.self, forKey: .geographyType)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.county = try container.decode(String.self, forKey: .county)
        self.country = try container.decode(String.self, forKey: .country)
        self.region = try container.decode(String.self, forKey: .region)
        self.subregion = try container.decode(String.self, forKey: .subregion)
        self.locale = try container.decode(String.self, forKey: .locale)
        self.locus = try container.decode(String.self, forKey: .locus)
        self.excavation = try container.decode(String.self, forKey: .excavation)
        self.river = try container.decode(String.self, forKey: .river)
        self.classification = try container.decode(String.self, forKey: .classification)
        self.rightsAndReproduction = try container.decode(String.self, forKey: .rightsAndReproduction)
        self.linkResource = try? container.decode(URL.self, forKey: .linkResource)
        let metadataDateString = try container.decode(String.self, forKey: .metadataDate)
        self.metadataDate = dateFormatter.date(from: metadataDateString)!
        self.repository = try container.decode(String.self, forKey: .repository)
        self.objectURL = try? container.decode(URL.self, forKey: .objectURL)
        self.tags = try container.decode([ObjectTag].self, forKey: .tags)
        self.objectWikidata = try? container.decode(URL.self, forKey: .objectWikidata)
        self.isTimelineWork = try container.decode(Bool.self, forKey: .isTimelineWork)
    }
}

public struct Constituent: Decodable {
    private enum CodingKey: String, Swift.CodingKey {
        case role = "role"
        case name = "name"
        case constituentULAN = "constituentULAN_URL"
        case constituentWikidata = "constituentWikidata_URL"
        case gender = "gender"
    }
    
    public let role: String
    public let name: String
    public let constituentULAN: URL
    public let constituentWikidata: URL
    public let gender: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.role = try container.decode(String.self, forKey: .role)
        self.name = try container.decode(String.self, forKey: .name)
        self.constituentULAN = try container.decode(URL.self, forKey: .constituentULAN)
        self.constituentWikidata = try container.decode(URL.self, forKey: .constituentWikidata)
        self.gender = try container.decode(String.self, forKey: .gender)
    }
}

public struct ObjectTag: Decodable {
    private enum CodingKey: String, Swift.CodingKey {
        case term = "term"
        case AAT = "AAT_URL"
    }
    
    public let term: String
    public let AAT: URL
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        self.term = try container.decode(String.self, forKey: .term)
        self.AAT = try container.decode(URL.self, forKey: .AAT)
    }
}
