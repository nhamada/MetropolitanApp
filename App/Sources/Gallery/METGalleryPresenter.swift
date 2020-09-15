//
//  METGalleryPresenter.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/24.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import UIKit
import METBase

final class METGalleryPresenter: GalleryPresenter, GalleryInteractorOutput {
    var output: GalleryPresenterOutput?
    
    init(output: GalleryPresenterOutput? = nil) {
        self.output = output
    }
    
    func onLoadDepartments(departments: [METDepartment]) {
        output?.requestRenderDepartments(departments: departments.map( {
            DepartmentViewItem(from: $0)
            }).sorted(by: {
                $0.id < $1.id
            }))
    }
    
    func onFailLoadingDepartments() {
        // TODO: Error handling
    }
    
    func onLoadRandomObject(object: METObject) {
        NSLog("\(object)")
        guard let imageURL = object.primaryImageURL else {
            onFailLoadingRandomObject()
            return
        }
        URLSession.shared.dataTask(with: imageURL,
                                   completionHandler: { [weak self] (data, _, _) in
                                    guard let data = data else {
                                        self?.output?.setBackgroundImage(image: nil)
                                        return
                                    }
                                    let image = UIImage(data: data, scale: 1.0)
                                    self?.output?.setBackgroundImage(image: image)
            }).resume()
    }
    
    func onFailLoadingRandomObject() {
        // TODO: Error handling
    }
}
