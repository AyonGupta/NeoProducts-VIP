//
//  PersistentContainerProvider.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import CoreData
class PersistentContainerProvider {
    
    private init() {}
    
    private static let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NeoProducts_VIP")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public static func getInstance() -> NSPersistentContainer {
        return persistentContainer
    }
}
