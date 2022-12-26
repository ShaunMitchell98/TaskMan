//
//  CreateModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 12/11/2022.
//

import Foundation

extension Tasks {
    internal class CreateModel {
        
        internal init (index: Int, listName: String) {
            self.index = index
            self.listName = listName
        }
        
        let index: Int
        
        let listName: String
    }
}
