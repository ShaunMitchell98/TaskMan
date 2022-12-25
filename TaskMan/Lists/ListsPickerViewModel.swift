//
//  PickerViewModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import Foundation

extension Lists {
    internal class PickerViewModel {
        
        private let listQueryHandler: ListQueryHandler
        
        internal init(listQueryHandler: ListQueryHandler) {
            self.listQueryHandler = listQueryHandler
        }
        
        internal func listAsync() async -> [TaskList] {
            return await listQueryHandler.Handle()
        }
    }
}

