//
//  ListQueryHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import CoreData
import Foundation

internal class ListQueryHandler {
    
    private let context : TaskManContext;
    
    internal init(context : TaskManContext)
    {
        self.context = context;
    }
    
    internal func Handle(request: ListQuery) async -> [TaskItem] {
            
        return await context.perform {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskItem")
            let results = self.context.fetchResults(request: fetchRequest)
            return results as! [TaskItem]
        }
    }
}
