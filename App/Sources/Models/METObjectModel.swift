//
//  METObjectModel.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/09/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

final class METObjectModel: ObjectModel {
    weak var output: ObjectModelOutput?
    
    private let objectIDListRepository: ObjectIDListRepository
    private let objectRepository: ObjectRepository
    
    init(objectIDListRepository: ObjectIDListRepository,
         objectRepository: ObjectRepository,
         output: ObjectModelOutput?) {
        self.objectIDListRepository = objectIDListRepository
        self.objectRepository = objectRepository
        self.output = output
    }
    
    func loadObjectIDList(departmentIds: [METDepartmentID]) {
        self.objectIDListRepository.loadObjectIDs(departmentIds: departmentIds,
                                                  completion: { [weak self] in
                                                    switch $0 {
                                                    case .success(let list):
                                                        self?.output?.onLoadObjectIDList(objectIDList: list)
                                                    case .failure(let error):
                                                        NSLog("Failed to load object ID list: \(error)")
                                                        self?.output?.onFailLoadingObjectIDList()
                                                    }
        })
    }
    
    func loadObject(objectId: METObjectID) {
        self.objectRepository.load(objectId: objectId,
                                   completion: { [weak self] in
                                    switch $0 {
                                    case .success(let object):
                                        self?.output?.onLoadObject(object: object)
                                    case .failure(let error):
                                        NSLog("Failed to load object: \(error)")
                                        self?.output?.onFailLoadingObject()
                                    }
        })
    }
}
