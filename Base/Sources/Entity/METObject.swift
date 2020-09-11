//
//  METObject.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/07.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

public typealias METObjectID = Int

public struct METObject {
    public let objectId: METObjectID
    public let isHighlight: Bool
    public let accessionNumber: String
    public let accessionYear: String
    public let isPublicDomain: Bool
    public let primaryImageURL: URL?
    public let primaryImageSmallURL: URL?
    public let additionalImageURLs: [URL]
    public let constituents: [METObjectConstituent]?
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
    public let artistWikidata: URL?
    public let artistULAN: URL?
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
    public let tags: [METObjectTag]?
    public let objectWikidata: URL?
    public let isTimelineWork: Bool
    
    internal init(from object: ObjectAPIResponse) {
        self.objectId = object.objectId
        self.isHighlight = object.isHighlight
        self.accessionNumber = object.accessionNumber
        self.accessionYear = object.accessionYear
        self.isPublicDomain = object.isPublicDomain
        self.primaryImageURL = object.primaryImageURL
        self.primaryImageSmallURL = object.primaryImageSmallURL
        self.additionalImageURLs = object.additionalImageURLs
        self.constituents = object.constituents?.map { METObjectConstituent(from: $0) }
        self.department = object.department
        self.objectName = object.objectName
        self.title = object.title
        self.culture = object.culture
        self.period = object.period
        self.dynasty = object.dynasty
        self.reign = object.reign
        self.portfolio = object.portfolio
        self.artistRole = object.artistRole
        self.artistPrefix = object.artistPrefix
        self.artistDisplayName = object.artistDisplayName
        self.artistDisplayBio = object.artistDisplayBio
        self.artistSuffix = object.artistSuffix
        self.artistAlphaSort = object.artistAlphaSort
        self.artistNationality = object.artistNationality
        self.artistBeginDate = object.artistBeginDate
        self.artistEndDate = object.artistEndDate
        self.artistGender = object.artistGender
        self.artistWikidata = object.artistWikidata
        self.artistULAN = object.artistULAN
        self.objectDate = object.objectDate
        self.objectBeginDate = object.objectBeginDate
        self.objectEndDate = object.objectEndDate
        self.medium = object.medium
        self.dimensions = object.dimensions
        self.creditLine = object.creditLine
        self.geographyType = object.geographyType
        self.city = object.city
        self.state = object.state
        self.county = object.county
        self.country = object.country
        self.region = object.region
        self.subregion = object.subregion
        self.locale = object.locale
        self.locus = object.locus
        self.excavation = object.excavation
        self.river = object.river
        self.classification = object.classification
        self.rightsAndReproduction = object.rightsAndReproduction
        self.linkResource = object.linkResource
        self.metadataDate = object.metadataDate
        self.repository = object.repository
        self.objectURL = object.objectURL
        self.tags = object.tags?.map { METObjectTag(from: $0) }
        self.objectWikidata = object.objectWikidata
        self.isTimelineWork = object.isTimelineWork
    }
    
}
