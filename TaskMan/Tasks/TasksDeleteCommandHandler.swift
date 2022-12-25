//
//  DeleteHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import CoreData
import Foundation

extension Tasks {
    public class DeleteCommandHandler {
        
        private let context: TaskManContext
        
        public init(context: TaskManContext) {
            self.context = context
        }
        
        public func Handle(task: TaskItem) async {
            
            await context.perform {
                self.context.delete(task)
                self.context.saveChanges()
            }
        }
    }
}

