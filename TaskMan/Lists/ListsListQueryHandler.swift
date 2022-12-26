//
//  ListPickerQueryHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import CoreData
import Foundation

extension Lists {
    public class ListQueryHandler {
        
        private let context: TaskManContext
        
        public init(context: TaskManContext) {
            self.context = context
        }
        
        public func Handle() async -> [TaskList] {
            
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
