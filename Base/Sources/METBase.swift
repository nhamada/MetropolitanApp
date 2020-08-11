//
//  METBase.swift
//  METBase
//
//  Created by Naohiro Hamada on 2020/08/11.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation
import CoreData

internal enum METBase {
    private static let modelName: String = "METBase"
    
    static var managedObjectContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentStoreCoordinator
        return context
    }()
    
    private static var managedObjectModel: NSManagedObjectModel = {
        guard let modelUrl = Bundle.sdk.url(forResource: modelName, withExtension: "momd") else {
            fatalError()
        }
        guard let model = NSManagedObjectModel(contentsOf: modelUrl) else {
            fatalError()
        }
        return model
    }()
    
    private static var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError()
        }
        let url = directory.appendingPathComponent("\(modelName).sqlite")
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                               configurationName: nil,
                                               at: url,
                                               options: nil)
        } catch {
            fatalError()
        }
        return coordinator
    }()
    
    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
}
