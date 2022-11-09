//
//  ListItemModel.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 09/11/2022.
//

import Foundation

internal class ListItemModel : Identifiable {
    
    init(name: String?) {
        self.name = name
    }
    
    let name: String?
}
