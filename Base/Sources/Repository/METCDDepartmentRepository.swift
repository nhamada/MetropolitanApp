//
//  METCDDepartmentRepository.swift
//  METBase
//
//  Created by Naohiro Hamada on 2020/08/11.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import CoreData

internal final class METCDDepartmentRepository: DepartmentRepository {
    
    private let context: NSManagedObjectContext
    
    internal init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    public func load(completion: @escaping LoadCompletionHandler) {
        let request = NSFetchRequest<METCDDepartment>(entityName: METCDDepartment.entityName)
        do {
            let results = try context.fetch(request)
            
            let departments = results.map { METDepartment(from: $0) }
            completion(.success(departments))
        } catch {
            completion(.failure(.unrecoverableNetworkError))
        }
    }
    
    public func clear() {
        let request = NSFetchRequest<METCDDepartment>(entityName: METCDDepartment.entityName)
        do {
            let results = try context.fetch(request)
            results.forEach {
                context.delete($0)
            }
            try context.save()
        } catch {
            
        }
    }
    
    public func store(departments: [METDepartment], completion: StoreCompletionHandler) {
        let result: Bool = departments.reduce(true) {
            guard $0 else {
                return $0
            }
            guard let entity = NSEntityDescription.insertNewObject(forEntityName: METCDDepartment.entityName, into: self.context) as? METCDDepartment else {
                return false
            }
            entity.id = $1.id
            entity.displayName = $1.displayName
            return true
        }
        if result {
            do {
                try context.save()
                completion(true)
            } catch {
                completion(false)
            }
        } else {
            completion(false)
        }
    }
}
