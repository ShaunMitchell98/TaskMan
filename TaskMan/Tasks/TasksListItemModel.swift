//
//  ListItemModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import CoreData
import Foundation

extension Tasks {
    internal class ListItemModel : Identifiable {
        
        init(id: NSManagedObjectID, name: String?) {
            self.id  = id
            self.name = name
        }
        
        let id: NSManagedObjectID
        
        let name: String?
    }
}

