//
//  DeleteCommand.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import CoreData
import Foundation

extension Tasks {
    internal class DeleteCommand {
        
        init (id: NSManagedObjectID) {
            self.id  = id
        }
        
        let id: NSManagedObjectID
    }
}

