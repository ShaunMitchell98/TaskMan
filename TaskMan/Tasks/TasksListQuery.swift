//
//  ListQuery.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import CoreData
import Foundation

extension Tasks {
    public class ListQuery {
        
        public init(listName: String) {
            self.ListName = listName
        }
        
        public let ListName: String
    }
}

