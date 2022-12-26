//
//  DatabaseInitialiser.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import Foundation

extension Database {
    internal class DatabaseInitialiser {
        
        private let context: TaskManContext
        
        internal init(context: TaskManContext) {
            self.context = context
        }
        
        internal func Initialise() {
            
            let defaultTaskList = TaskList(context: context)
            defaultTaskList.name = "Reminders"
            defaultTaskList.isDefault = true
            self.context.saveChanges()
        }
    }
}

