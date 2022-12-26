//
//  ListsDeleteCommandHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import CoreData
import Foundation

extension Lists {
    public class DeleteCommandHandler {
        
        private let context: TaskManContext
        
        public init(context: TaskManContext) {
            self.context = context
        }
        
        public func Handle(list: TaskList) async {
            
            await context.perform {
                self.context.delete(list)
                self.context.saveChanges()
            }
        }
    }
}


