//
//  BaseCoreDataService.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import CoreData
protocol IBaseCoreDataService: AnyObject {
    func fetchData<T:NSManagedObject>(entity: T.Type,
                                      format : String?,
                                      completionHandler : @escaping ([T]) -> Void)
    func saveContext () -> Result <Bool, CustomError>
    func deleteDataWithPredicate<T:NSManagedObject>(entity: T.Type,
                                                    format : String?,
                                                    completionHandler : @escaping (Bool) -> Void)
}

class BaseCoreDataService: IBaseCoreDataService {
    let persistentContainer = PersistentContainerProvider.getInstance()
    lazy var managedContext: NSManagedObjectContext = { persistentContainer.viewContext
    }()
    
    /*
     * Method name: saveContext
     * Description: use to save context
     * Parameters:
     * Return:  Result
     */
    func saveContext () -> Result <Bool, CustomError> {
        if managedContext.hasChanges {
            do {
                try managedContext.save()
                return .success(true)
            } catch let err {
                return .failure(CustomError (title: "",
                                             description: err.localizedDescription,
                                             code: -1))
            }
        }
        else {
            return .failure(CustomError (title: "",
                                         description: "No changes in context",
                                         code: -1))
        }
    }
    
    /*
     * Method name: fetchData
     * Description: use to fecth data from Core data
     * Parameters: entity, format and completion handler
     * Return:  -
     */
    func fetchData<T:NSManagedObject>(entity: T.Type,
                                      format : String?,
                                      completionHandler : @escaping ([T]) -> Void) {
        var result = [T]()
        managedContext.perform {
            let entityName = String(describing: entity)
            let fetchRequest = NSFetchRequest<T>(entityName: entityName)
            do {
                if  let predicateFormat = format, !predicateFormat.isEmpty {
                    fetchRequest.predicate = NSPredicate(format: predicateFormat)
                    if fetchRequest.predicate == nil { completionHandler(result); return }
                }
                fetchRequest.returnsObjectsAsFaults = false
                result = try self.managedContext.fetch(fetchRequest)
            } catch {  }
            completionHandler(result)
        }
    }
    /*
     * Method name: deleteDataWithPredicate
     * Description: use to delete data from Core data
     * Parameters: entity, format and completion handler
     * Return:  -
     */
    func deleteDataWithPredicate<T:NSManagedObject>(entity: T.Type,
                                                    format : String?,
                                                    completionHandler : @escaping (Bool) -> Void) {
        self.fetchData(entity: entity.self, format: format) { (results) in
            for result in results {
                self.managedContext.delete(result)
            }
            completionHandler(true)
        }
    }
}
