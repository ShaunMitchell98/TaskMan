//
//  CreateHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 06/11/2022.
//

import CoreData
import Foundation

internal class CreateHandler {
    
    let context : NSManagedObjectContext;
    
    internal init(context : NSManagedObjectContext)
    {
        self.context = context;
    }
    
    internal func Handle(index: Int) -> TaskItem? {
        
        let taskItem = NSEntityDescription.insertNewObject(forEntityName: "TaskItem", into: context) as! TaskItem
        
        taskItem.name = "Temp \(index)"

        do {
           try context.save()
            return taskItem
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
