//
//  DeleteHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import CoreData
import Foundation

internal class DeleteHandler {
    
    private let context: NSManagedObjectContext
    
    internal init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func Handle(taskItem: TaskItem) {
        context.delete(taskItem)
        
        do {
           try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
