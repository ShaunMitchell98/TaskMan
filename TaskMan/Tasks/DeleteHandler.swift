//
//  DeleteHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 07/11/2022.
//

import CoreData
import Foundation

internal class DeleteHandler {
    
    private let context: TaskManContext
    
    internal init(context: TaskManContext) {
        self.context = context
    }
    
    func Handle(command: DeleteCommand) {
        
        do {
            let task = try context.existingObject(with: command.id)
            context.delete(task)
            context.saveChanges()
        }
        catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

    }
}
