//
//  CreateModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import Foundation

extension Tasks {
    public class CreateModel {
        
        public init (index: Int, listName: String) {
            self.index = index
            self.listName = listName
        }
        
        public let index: Int
        
        public let listName: String
    }
}
