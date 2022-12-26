//
//  ListsDeleteCommand.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import CoreData
import Foundation

extension Lists {
    internal class DeleteCommand {
        
        init (id: NSManagedObjectID) {
            self.id  = id
        }
        
        let id: NSManagedObjectID
    }
}


