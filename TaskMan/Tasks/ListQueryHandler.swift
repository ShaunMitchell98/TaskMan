//
//  ListQueryHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import CoreData
import Foundation

internal class ListQueryHandler {
    
    let context : NSManagedObjectContext;
    
    internal init(context : NSManagedObjectContext)
    {
        self.context = context;
    }
    
    internal func Handle(request: ListQuery) -> [ListItemModel] {
            
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskItem")
        
        do {
            let results = try context.fetch(fetchRequest)
            let taskItems = results as! [TaskItem]
            return taskItems.map { return ListItemModel(name: $0.name) }
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
