//
//  ListQueryHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import CoreData
import Foundation

public class ListQueryHandler {
    
    private let context : TaskManContext;
    
    public init(context : TaskManContext)
    {
        self.context = context;
    }
    
    public func Handle(request: ListQuery) async -> [TaskItem] {
            
        return await context.perform {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskItem")
            let results = self.context.fetchResults(request: fetchRequest)
            return results as! [TaskItem]
        }
    }
}
