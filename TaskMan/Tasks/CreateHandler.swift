//
//  CreateHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 06/11/2022.
//

import CoreData
import Foundation

internal class CreateHandler {
    
    let context : TaskManContext;
    
    internal init(context : TaskManContext)
    {
        self.context = context;
    }
    
    internal func Handle(request: CreateModel) -> TaskItem? {
        
        let taskItem = NSEntityDescription.insertNewObject(forEntityName: "TaskItem", into: context) as! TaskItem
        
        taskItem.name = "Temp \(request.index)"
        context.saveChanges()
        return taskItem
    }
}
