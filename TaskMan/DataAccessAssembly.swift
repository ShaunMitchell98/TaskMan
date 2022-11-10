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
        container.register(NSManagedObjectContext.self) { r in
            let controller = r.resolve(PersistenceController.self)!
            return controller.container.viewContext
        }
        .inObjectScope(.container)
        
        container.register(PersistenceController.self) { _ in PersistenceController.shared }
            .inObjectScope(.container)
    }
}
