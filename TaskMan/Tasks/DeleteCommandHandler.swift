//
//  DeleteHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import CoreData
import Foundation

internal class DeleteCommandHandler {
    
    private let context: TaskManContext
    
    internal init(context: TaskManContext) {
        self.context = context
    }
    
    func Handle(task: TaskItem) async {
        
        await context.perform {
            self.context.delete(task)
            self.context.saveChanges()
        }
    }
}
