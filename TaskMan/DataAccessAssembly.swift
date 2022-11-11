//
//  DataAccessAssembly.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 10/11/2022.
//

import CoreData
import Foundation
import Swinject

internal class DataAccessAssembly : Assembly {
    
    internal func assemble(container: Container) {
        
        container.register(TaskManContext.self) { r in
            let container = NSPersistentContainer(name: "TaskMan")
            let context = TaskManContext(NSManagedObjectContext.ConcurrencyType.mainQueue)
            
            let coordinator = container.persistentStoreCoordinator
            context.persistentStoreCoordinator = coordinator
            
            do {
                try _ = coordinator.addPersistentStore(type:NSPersistentStore.StoreType.sqlite,
                                               at:URL(fileURLWithPath: "/Users/shaunmitchell/TaskManData/Data.sqlite"))
            }
            catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            container.viewContext.automaticallyMergesChangesFromParent = true

            return context
        }
        .inObjectScope(.container)
    }
}
