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
        container.autoregister(CreateModelHandler.self, initializer: CreateModelHandler.init)
        
        container.autoregister(DeleteCommandHandler.self, initializer: DeleteCommandHandler.init)
        
        container.autoregister(ListQueryHandler.self, initializer: ListQueryHandler.init)
        
        container.autoregister(ListViewModel.self, initializer: ListViewModel.init)
        
        container.autoregister(EditViewModel.self, initializer: EditViewModel.init)
    }
}
