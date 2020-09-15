//
//  ObjectModel.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/09/05.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

protocol ObjectModelOutput: class {
    func onLoadObjectIDList(objectIDList: [METObjectID])
    func onLoadObject(object: METObject)
    
    func onFailLoadingObjectIDList()
    func onFailLoadingObject()
}

protocol ObjectModel {
    var output: ObjectModelOutput? { get set }
    
    func loadObjectIDList(departmentIds: [METDepartmentID])
    
    func loadObject(objectId: METObjectID)
}
