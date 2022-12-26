//
//  ListsCreateModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 25/12/2022.
//

import Foundation

extension Lists {
    public class CreateModel {
        
        public init (index: Int) {
            self.index = index
        }
        
        public let index: Int
    }
}
