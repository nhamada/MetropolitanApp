//
//  METGralleryInteractor.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/23.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import METBase

final class METGalleryInteractor: GalleryInteractor, DepartmentModelOutput, ObjectModelOutput {
    private(set) var departmentModel: DepartmentModel
    private(set) var objectModel: ObjectModel
    var output: GalleryInteractorOutput?
    
    init(departmentModel: DepartmentModel,
         objectModel: ObjectModel,
         output: GalleryInteractorOutput? = nil) {
        self.departmentModel = departmentModel
        self.objectModel = objectModel
        self.output = output
        
        self.departmentModel.output = self
        self.objectModel.output = self
    }
    
    func loadDepartments() {
        departmentModel.load()
    }
    
    func loadRandomObject(departmentIDList: [METDepartmentID]) {
        guard let departmentID = departmentIDList.randomElement() else {
            output?.onFailLoadingRandomObject()
            return
        }
        objectModel.loadObjectIDList(departmentIds: [departmentID])
    }
    
    // MARK:- DepartmentModelOutput
    
    func onLoad(departments: [METDepartment]) {
        output?.onLoadDepartments(departments: departments)
    }
    
    func onFailLoadingDepartments() {
        output?.onFailLoadingDepartments()
    }
    
    // MARK:- ObjectModelOutput
    
    func onLoadObjectIDList(objectIDList: [METObjectID]) {
        NSLog("\(#function): objectIDList=\(objectIDList)")
        guard let objectID = objectIDList.randomElement() else {
            output?.onFailLoadingRandomObject()
            return
        }
        objectModel.loadObject(objectId: objectID)
    }
    
    func onLoadObject(object: METObject) {
        NSLog("\(#function)")
        output?.onLoadRandomObject(object: object)
    }
    
    func onFailLoadingObjectIDList() {
        NSLog("\(#function)")
        output?.onFailLoadingRandomObject()
    }
    
    func onFailLoadingObject() {
        NSLog("\(#function)")
        output?.onFailLoadingRandomObject()
    }
    
}
