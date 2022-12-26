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
                
                let listFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskList")
                listFetchRequest.predicate = NSPredicate(format: "name = %@", request.listName)
                
                let list = self.context.fetchResults(request: listFetchRequest)[0] as! TaskList
                
                taskItem.name = "Temp \(request.index)"
                taskItem.list = list
                self.context.saveChanges()
                return taskItem
            }
        }
    }
}

