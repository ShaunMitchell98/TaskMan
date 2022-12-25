//
//  CreateHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 06/11/2022.
//

import CoreData
import Foundation

extension Tasks {
    public class CreateModelHandler {
        
        let context : TaskManContext;
        
        internal init(context : TaskManContext)
        {
            self.context = context;
        }
        
        public func Handle(request: CreateModel) async -> TaskItem? {
            
            return await context.perform {
                let taskItem = NSEntityDescription.insertNewObject(forEntityName: "TaskItem", into: self.context) as! TaskItem
                
                let defaultListFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskList")
                defaultListFetchRequest.predicate = NSPredicate(format: "isDefault = true")
                
                let defaultList = self.context.fetchResults(request: defaultListFetchRequest)[0] as! TaskList
                
                taskItem.name = "Temp \(request.index)"
                taskItem.list = defaultList
                self.context.saveChanges()
                return taskItem
            }
        }
    }
}

