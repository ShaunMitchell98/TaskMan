//
//  ListPickerQueryHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import CoreData
import Foundation

extension Lists {
    internal class ListQueryHandler {
        
        private let context: TaskManContext
        
        internal init(context: TaskManContext) {
            self.context = context
        }
        
        internal func Handle() async -> [TaskList] {
            
            return await context.perform {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskList")
                let sort = NSSortDescriptor(key: "name", ascending: true)
                fetchRequest.sortDescriptors = [sort]
                
                let results = self.context.fetchResults(request: fetchRequest)
                return results as! [TaskList]
            }
        }
    }
}
