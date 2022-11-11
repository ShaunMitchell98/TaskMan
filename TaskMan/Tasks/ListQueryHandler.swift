//
//  ListQueryHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import CoreData
import Foundation

internal class ListQueryHandler {
    
    let context : TaskManContext;
    
    internal init(context : TaskManContext)
    {
        self.context = context;
    }
    
    internal func Handle(request: ListQuery) -> [ListItemModel] {
            
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskItem")
        let results = context.fetchResults(request: fetchRequest)
        let taskItems = results as! [TaskItem]
        return taskItems.map { return ListItemModel(name: $0.name) }
    }
}
