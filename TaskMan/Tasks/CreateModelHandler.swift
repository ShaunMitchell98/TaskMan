//
//  CreateHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 06/11/2022.
//

import CoreData
import Foundation

internal class CreateModelHandler {
    
    let context : TaskManContext;
    
    internal init(context : TaskManContext)
    {
        self.context = context;
    }
    
    internal func Handle(request: CreateModel) async -> TaskItem? {
        
        return await context.perform {
            let taskItem = NSEntityDescription.insertNewObject(forEntityName: "TaskItem", into: self.context) as! TaskItem
            
            taskItem.name = "Temp \(request.index)"
            self.context.saveChanges()
            return taskItem
        }
    }
}
