//
//  DataAccessAssembly.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 10/11/2022.
//

import CoreData
import Foundation
import Swinject
import SwinjectAutoregistration

extension Database {
    
    internal class DataAccessAssembly : Assembly {
        
        private let configuration: NSDictionary
        
        init(configuration: NSDictionary) {
            self.configuration = configuration
        }
        
        internal func assemble(container: Container) {
            
            container.autoregister(DatabaseInitialiser.self, initializer: DatabaseInitialiser.init)
            
            container.register(TaskManContext.self) { r in
                let container = NSPersistentContainer(name: "TaskMan")
                let context = TaskManContext(NSManagedObjectContext.ConcurrencyType.mainQueue)
                
                let coordinator = container.persistentStoreCoordinator
                context.persistentStoreCoordinator = coordinator
                
                var databaseExists = false
                do {
                    let databasePath: String = self.configuration["TaskManDatabasePath"] as! String;
                    databaseExists = FileManager.default.fileExists(atPath: databasePath)
                    
                    try _ = coordinator.addPersistentStore(type:.sqlite,
                                                   at:URL(fileURLWithPath: databasePath))
                }
                catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                
                if (!databaseExists) {
                    let databaseInitialiser = r.resolve(DatabaseInitialiser.self)
                    databaseInitialiser?.Initialise()
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
}

