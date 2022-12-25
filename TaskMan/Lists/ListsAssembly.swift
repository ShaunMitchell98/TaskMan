//
//  ListsAssembly.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import Foundation
import Swinject

extension Lists {
    
    internal class ListsAssembly : Assembly {
        internal func assemble(container: Container) {
            
            container.autoregister(PickerViewModel.self, initializer: PickerViewModel.init)
            
            container.autoregister(ListQueryHandler.self, initializer: ListQueryHandler.init)
        }
    }
}
