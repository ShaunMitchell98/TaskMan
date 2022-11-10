//
//  TasksAssembly.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 10/11/2022.
//

import Foundation
import Swinject
import SwinjectAutoregistration

internal class TasksAssembly : Assembly {
    
    internal func assemble(container: Container) {
        container.autoregister(CreateHandler.self, initializer: CreateHandler.init)
        
        container.autoregister(DeleteHandler.self, initializer: DeleteHandler.init)
        
        container.autoregister(ListQueryHandler.self, initializer: ListQueryHandler.init)
        
        container.autoregister(ListModel.self, initializer: ListModel.init)
    }
}
