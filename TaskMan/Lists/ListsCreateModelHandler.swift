//
//  CreateHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import CoreData
import Foundation

extension Lists {
    public class CreateModelHandler {
        
        let context : TaskManContext;
        
        internal init(context : TaskManContext)
        {
            self.context = context;
        }
        
        public func Handle(request: CreateModel) async -> TaskList? {
            
            return await context.perform {
                let taskList = NSEntityDescription.insertNewObject(forEntityName: "TaskList", into: self.context) as! TaskList
                
                taskList.name = "Temp \(request.index)"
                taskList.isDefault = false
                self.context.saveChanges()
                return taskList
            }
        }
    }
}


