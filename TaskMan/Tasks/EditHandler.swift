//
//  EditHandler.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 14/11/2022.
//

import Foundation

internal class EditHandler {
    
    let context : TaskManContext;
    
    internal init(context : TaskManContext)
    {
        self.context = context;
    }
    
    internal func Handle(request: TaskItem) {
        
        context.saveChanges()
    }
}
