//
//  DeleteHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import CoreData
import Foundation

internal class DeleteHandler {
    
    private let context: TaskManContext
    
    internal init(context: TaskManContext) {
        self.context = context
    }
    
    func Handle(command: DeleteCommand) {
        
        //context.
        //context.delete(taskItem)
        context.saveChanges()
    }
}
