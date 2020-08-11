//
//  METCDDepartment.swift
//  METBase
//
//  Created by Naohiro Hamada on 2020/08/11.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import CoreData

internal final class METCDDepartment: NSManagedObject {
    @NSManaged var id: Int
    @NSManaged var displayName: String
}
