//
//  DeleteCommand.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import CoreData
import Foundation

extension Tasks {
    public class DeleteCommand {
        
        public init (id: NSManagedObjectID) {
            self.id  = id
        }
        
        public let id: NSManagedObjectID
    }
}

